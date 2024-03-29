import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/ui/pages/reports/reports_bloc.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:money_tracker/utils/extensions.dart';

const double _FIRST_COLUMN_WIDTH = 100;
const double _CELL_WIDTH = 100;
const int YEAR = 2021;
const double _CELL_HEIGHT = 32;

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleReports),
      ),
      body: BlocProvider<ReportsBloc>(
        create: (context) => ReportsBloc(context.read<LocalSource>())
          ..getCashflow(DateTime.now().year),
        child: BlocBuilder<ReportsBloc, ReportsState>(
          builder: (context, state) {
            if (state is InProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Data) {
              return ConsolidateReport();
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: _FIRST_COLUMN_WIDTH,
      rightHandSideColumnWidth: 14 * _CELL_WIDTH,
      isFixedHeader: true,
      headerWidgets: [
        Cell(text: ''),
        ...List.generate(
            12,
            (i) => Cell(
                text:
                    DateFormat.MMMM(Localizations.localeOf(context).toString())
                        .format(DateTime(YEAR, i + 1))
                        .capitalize())),
        Cell(text: ''),
        Cell(
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
                  )),
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
    Key? key,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
