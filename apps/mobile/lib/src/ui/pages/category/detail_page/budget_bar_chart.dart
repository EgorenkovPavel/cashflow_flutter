import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';

import '../../../../domain/models.dart';
import '../../../../injection_container.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/sum_on_date.dart';
import '../../../blocs/category_cashflow_bloc.dart';
import 'budget_bar_chart_bloc.dart';

class BudgetBarChart extends StatelessWidget {
  final int categoryId;

  const BudgetBarChart({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<BudgetBarChartBloc>()
            ..add(BudgetBarChartEvent.fetch(categoryId: categoryId, amount: 6)),
      child: BlocBuilder<BudgetBarChartBloc, BudgetBarChartState>(
        builder: (context, state) {
          final cashFlow = context.watchCashflowById(categoryId);
          final budgetLimit = cashFlow.budget;
          final budgetType = cashFlow.budgetType;

          final res = state.data;
          final List<SumOnDate> data = [];
          res.forEach(
            (key, value) =>
                data.add(SumOnDate(key, context.balanceToRub(value).sum)),
          );

          data.sort((a, b) => a.date.compareTo(b.date));

          String locale = Localizations.localeOf(context).languageCode;
          final dateFormat = switch (budgetType) {
            BudgetType.MONTH => DateFormat('MMM', locale),
            BudgetType.YEAR => DateFormat('yyyy', locale),
          };

          final maxY = data.map((e) => e.sum).fold(0, math.max) * 1.3;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    // Максимум для шкалы Y
                    // barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                dateFormat.format(
                                  data.elementAt(value.toInt()).date,
                                ),
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: budgetLimit.toDouble(),
                          color: Color(0xFFD16666),
                          strokeWidth: 2,
                          dashArray: [5, 5],
                          // Пунктир
                          label: HorizontalLineLabel(
                            show: true,
                            alignment: Alignment.topRight,
                            labelResolver: (line) =>
                                '${context.loc.limit}: ${context.loc.sumFormat(Money(budgetLimit.toInt(), Currency.RUB))}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFFD16666),
                            ),
                          ),
                        ),
                      ],
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    // Генерация столбиков
                    barGroups: _generateGroups(
                      context,
                      data,
                      budgetLimit,
                      maxY,
                    ),
                    barTouchData: BarTouchData(
                      enabled: false,
                      // Выключаем интерактивность, чтобы текст был статичным
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => Colors.transparent,
                        // Делаем фон подсказки прозрачным
                        tooltipPadding: EdgeInsets.zero,
                        tooltipMargin: 3,
                        // Отступ суммы от верха столбика
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            // Форматируем число: 15400 -> 15.4к (если число большое) или просто целое
                            rod.toY >= 1000
                                ? '${(rod.toY / 1000).toStringAsFixed(1)}к'
                                : rod.toY.toInt().toString(),
                            TextStyle(
                              color: rod.toY > budgetLimit
                                  ? Color(0xFFD16666)
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(context.loc.titleFact, style: Theme.of(context).textTheme.titleSmall,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.average),
                  Text('${calculateAverage(data.map((e) => e.sum).toList())}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.median),
                  Text('${calculateMedian(data.map((e) => e.sum).toList())}'),
                ],
              ),
              Text(context.loc.titlePlan, style: Theme.of(context).textTheme.titleSmall,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.monthBudget),
                  Text('${cashFlow.monthBudget}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.yearBudget),
                  Text('${cashFlow.yearBudget}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  List<BarChartGroupData> _generateGroups(
    BuildContext context,
    List<SumOnDate> data,
    int budgetLimit,
    double maxY,
  ) {
    return List.generate(data.length, (index) {
      final value = data.elementAt(index).sum;
      final isOverBudget = value > budgetLimit;

      return BarChartGroupData(
        x: index,
        showingTooltipIndicators: [0],
        barRods: [
          BarChartRodData(
            toY: value.toDouble(),
            color: isOverBudget
                ? Color(0xFFD16666)
                : Theme.of(context).primaryColor,
            width: 30,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: maxY,
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            ),
          ),
        ],
      );
    });
  }

  static int calculateAverage(List<int> values) {
    if (values.isEmpty) return 0;
    final sum = values.reduce((a, b) => a + b);

    return (sum / values.length).round();
  }

  static int calculateMedian(List<int> values) {
    if (values.isEmpty) return 0;

    // ВАЖНО: для медианы список ДОЛЖЕН быть отсортирован
    List<int> sorted = List.from(values)..sort();
    int middle = sorted.length ~/ 2;

    if (sorted.length % 2 == 1) {
      // Если нечетное кол-во элементов — берем центральный
      return sorted[middle];
    } else {
      // Если четное — среднее между двумя центральными
      return ((sorted[middle - 1] + sorted[middle]) / 2.0).round();
    }
  }
}
