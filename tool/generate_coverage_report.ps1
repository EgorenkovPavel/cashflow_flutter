param(
    [Parameter(Mandatory = $true)]
    [string]$LcovPath,

    [Parameter(Mandatory = $true)]
    [string]$OutputDir
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $LcovPath)) {
    throw "Coverage file not found: $LcovPath"
}

$absoluteLcovPath = (Resolve-Path -LiteralPath $LcovPath).Path
$absoluteOutputDir = [System.IO.Path]::GetFullPath($OutputDir)

New-Item -ItemType Directory -Force -Path $absoluteOutputDir | Out-Null

$records = @()
$currentFile = $null
$currentExecutable = 0
$currentCovered = 0

foreach ($line in Get-Content -LiteralPath $absoluteLcovPath) {
    if ($line.StartsWith('SF:')) {
        $currentFile = $line.Substring(3)
        $currentExecutable = 0
        $currentCovered = 0
        continue
    }

    if ($line.StartsWith('DA:')) {
        $parts = $line.Substring(3).Split(',')
        if ($parts.Length -ge 2) {
            $currentExecutable++

            if ([int]$parts[1] -gt 0) {
                $currentCovered++
            }
        }
        continue
    }

    if ($line -eq 'end_of_record' -and $null -ne $currentFile) {
        $percentage = if ($currentExecutable -eq 0) {
            0.0
        } else {
            [math]::Round(($currentCovered * 100.0) / $currentExecutable, 2)
        }

        $records += [pscustomobject]@{
            File       = $currentFile
            Executable = $currentExecutable
            Covered    = $currentCovered
            Percentage = $percentage
        }

        $currentFile = $null
    }
}

$totalExecutable = ($records | Measure-Object -Property Executable -Sum).Sum
$totalCovered = ($records | Measure-Object -Property Covered -Sum).Sum

if ($null -eq $totalExecutable) { $totalExecutable = 0 }
if ($null -eq $totalCovered) { $totalCovered = 0 }

$totalPercentage = if ($totalExecutable -eq 0) {
    0.0
} else {
    [math]::Round(($totalCovered * 100.0) / $totalExecutable, 2)
}

$rows = foreach ($record in ($records | Sort-Object Percentage, File -Descending)) {
    $safeFile = [System.Net.WebUtility]::HtmlEncode($record.File)
    @"
<tr>
  <td>$safeFile</td>
  <td>$($record.Covered)</td>
  <td>$($record.Executable)</td>
  <td>$($record.Percentage)%</td>
</tr>
"@
}

$rowsHtml = if ($rows.Count -eq 0) {
    '<tr><td colspan="4">No coverage records found.</td></tr>'
} else {
    ($rows -join [Environment]::NewLine)
}

$reportHtml = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Coverage Report</title>
  <style>
    body {
      font-family: Segoe UI, Arial, sans-serif;
      margin: 24px;
      color: #1f2937;
      background: #f8fafc;
    }
    h1 {
      margin-bottom: 8px;
    }
    .summary {
      margin-bottom: 24px;
      padding: 16px;
      background: #ffffff;
      border: 1px solid #e5e7eb;
      border-radius: 10px;
      max-width: 520px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background: #ffffff;
      border: 1px solid #e5e7eb;
    }
    th, td {
      padding: 10px 12px;
      border-bottom: 1px solid #e5e7eb;
      text-align: left;
      vertical-align: top;
    }
    th {
      background: #f1f5f9;
    }
    tr:nth-child(even) {
      background: #f8fafc;
    }
    .path {
      color: #64748b;
      margin-bottom: 12px;
    }
  </style>
</head>
<body>
  <h1>Coverage Report</h1>
  <div class="path">Source: $absoluteLcovPath</div>
  <div class="summary">
    <div><strong>Total coverage:</strong> $totalPercentage%</div>
    <div><strong>Covered lines:</strong> $totalCovered</div>
    <div><strong>Executable lines:</strong> $totalExecutable</div>
    <div><strong>Files:</strong> $($records.Count)</div>
  </div>
  <table>
    <thead>
      <tr>
        <th>File</th>
        <th>Covered</th>
        <th>Executable</th>
        <th>Coverage</th>
      </tr>
    </thead>
    <tbody>
      $rowsHtml
    </tbody>
  </table>
</body>
</html>
"@

$reportPath = Join-Path $absoluteOutputDir 'index.html'
Set-Content -LiteralPath $reportPath -Value $reportHtml -Encoding UTF8

Write-Host "Coverage report generated: $reportPath"
