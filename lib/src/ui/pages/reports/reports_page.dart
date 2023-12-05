// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/reports/reports_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

const double _FIRST_COLUMN_WIDTH = 100;
const double _CELL_WIDTH = 100;
const int YEAR = 2021;
const double _CELL_HEIGHT = 32;

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.titleReports),
      ),
      body: BlocProvider<ReportsBloc>(
        create: (context) => sl<ReportsBloc>()
          ..getCashflow(DateTime.now().year),
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
  const ConsolidateReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: _FIRST_COLUMN_WIDTH,
      rightHandSideColumnWidth: 14 * _CELL_WIDTH,
      isFixedHeader: true,
      headerWidgets: [
        const Cell(text: ''),
        ...List.generate(
          12,
          (i) => Cell(
            text: DateFormat.MMMM(Localizations.localeOf(context).toString())
                .format(DateTime(YEAR, i + 1))
                .capitalize(),
          ),
        ),
        const Cell(text: ''),
        const Cell(
          text: 'Total',
          bold: true,
        ),
      ],
      leftSideItemBuilder: (context, index) {
        return Cell(text: 'Left $index');
      },
      rightSideItemBuilder: (context, row) {
        return Row(
          children: List.generate(
            14,
            (col) => Cell(
              text: '$row - $col',
              alignment: Alignment.centerRight,
            ),
          ),
        );
      },
      itemCount: 100,
      rowSeparatorWidget: const Divider(
        color: Colors.black54,
        height: 1.0,
        thickness: 0.0,
      ),
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
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
