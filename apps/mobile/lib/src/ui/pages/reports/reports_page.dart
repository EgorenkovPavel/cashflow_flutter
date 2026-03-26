// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/reports/reports_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

const double _FIRST_COLUMN_WIDTH = 100;
const double _CELL_WIDTH = 100;
const int YEAR = 2021;
const double _CELL_HEIGHT = 32;

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.titleReports)),
      body: BlocProvider<ReportsBloc>(
        create: (context) =>
            sl<ReportsBloc>()..getCashflow(DateTime.now().year),
        child: BlocBuilder<ReportsBloc, ReportsState>(
          builder: (context, state) {
            if (state is InProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Data) {
              return const ConsolidateReport();
            } else {
              throw Exception('no such state');
            }
          },
        ),
      ),
    );
  }
}

class ConsolidateReport extends StatelessWidget {
  const ConsolidateReport({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return HorizontalDataTable(
  //     leftHandSideColumnWidth: _FIRST_COLUMN_WIDTH,
  //     rightHandSideColumnWidth: 14 * _CELL_WIDTH,
  //     isFixedHeader: true,
  //     headerWidgets: [
  //       const Cell(text: ''),
  //       ...List.generate(
  //         12,
  //         (i) => Cell(
  //           text: DateFormat.MMMM(Localizations.localeOf(context).toString())
  //               .format(DateTime(YEAR, i + 1))
  //               .capitalize(),
  //         ),
  //       ),
  //       const Cell(text: ''),
  //       const Cell(
  //         text: 'Total',
  //         bold: true,
  //       ),
  //     ],
  //     leftSideItemBuilder: (context, index) {
  //       return Cell(text: 'Left $index');
  //     },
  //     rightSideItemBuilder: (context, row) {
  //       return Row(
  //         children: List.generate(
  //           14,
  //           (col) => Cell(
  //             text: '$row - $col',
  //             alignment: Alignment.centerRight,
  //           ),
  //         ),
  //       );
  //     },
  //     itemCount: 100,
  //     rowSeparatorWidget: const Divider(
  //       color: Colors.black54,
  //       height: 1.0,
  //       thickness: 0.0,
  //     ),
  //   );
  // }

  static const Color _primaryColor = Color(0xFF236F57);

  @override
  Widget build(BuildContext context) {
    // Тестовые данные: Категория -> [Суммы по месяцам]
    final Map<String, List<int>> data = {
      'Продукты': [15000, 14200, 16100, 13800, 15500, 14900],
      'Транспорт': [5000, 7500, 4800, 5200, 6000, 5100],
      'Развлечения': [3000, 12000, 2500, 4000, 8000, 3500],
      'Жилье': [30000, 30000, 30500, 30000, 30000, 30000],
      'Здоровье': [1000, 0, 5400, 200, 0, 1200],
    };

    final months = ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн'];

    return TableView.builder(
      // Количество колонок: Категория + Месяцы
      columnCount: months.length + 1,
      rowCount: data.length + 1,
      // Закрепляем первую строку и первую колонку
      pinnedRowCount: 1,
      pinnedColumnCount: 1,
      columnBuilder: (index) => TableSpan(
        extent: FixedTableSpanExtent(
          index == 0 ? 140 : 80,
        ), // Первая колонка шире
      ),
      rowBuilder: (index) => const TableSpan(extent: FixedTableSpanExtent(50)),
      cellBuilder: (context, vicinity) {
        final isHeaderRow = vicinity.row == 0;
        final isHeaderColumn = vicinity.column == 0;

        // Логика отображения контента
        Widget content;
        if (isHeaderRow && isHeaderColumn) {
          content = const Text(
            'Категория',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          );
        } else if (isHeaderRow) {
          content = Text(
            months[vicinity.column - 1],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        } else if (isHeaderColumn) {
          content = Text(
            data.keys.elementAt(vicinity.row - 1),
            style: const TextStyle(fontWeight: FontWeight.w500),
          );
        } else {
          final value = data.values.elementAt(
            vicinity.row - 1,
          )[vicinity.column - 1];
          content = Text('$value', textAlign: TextAlign.right);
        }

        return TableViewCell(
          child: Container(
            alignment: isHeaderColumn
                ? Alignment.centerLeft
                : Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isHeaderRow
                  ? _primaryColor
                  : (vicinity.row % 2 == 0 ? Colors.grey[50] : Colors.white),
              border: Border.all(color: Colors.grey[200]!, width: 0.5),
            ),
            child: content,
          ),
        );
      },
    );
  }
}

class Cell extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final bool bold;

  const Cell({
    super.key,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _CELL_WIDTH,
      height: _CELL_HEIGHT,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
