import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/currency_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/balance.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:money_tracker/src/utils/sum.dart';

part 'currency_rate_bloc.freezed.dart';

@freezed
class CurrencyRateEvent with _$CurrencyRateEvent {
  const factory CurrencyRateEvent.fetch() = _FetchCurrencyRateEvent;

  const factory CurrencyRateEvent.change({
    required double usd,
    required double eur,
  }) = _ChangeCurrencyRateEvent;
}

@freezed
class CurrencyRateState with _$CurrencyRateState {
  const CurrencyRateState._();

  const factory CurrencyRateState({
    required double usd,
    required double eur,
  }) = _CurrencyRateState;
}

class CurrencyRateBloc extends Bloc<CurrencyRateEvent, CurrencyRateState> {
  final CurrencyInteractor _currencyInteractor;

  CurrencyRateBloc(this._currencyInteractor)
      : super(const CurrencyRateState(usd: 1, eur: 1)) {
    on<CurrencyRateEvent>(
      (event, emit) => event.map(
          fetch: (event) => _onFetch(event, emit),
          change: (event) =>
              emit(CurrencyRateState(usd: event.usd, eur: event.eur))),
    );

    add(CurrencyRateEvent.fetch());
  }

  Future<void> _onFetch(
    _FetchCurrencyRateEvent event,
    Emitter<CurrencyRateState> emit,
  ) async {
    final usd = await _currencyInteractor.usdRate();
    final eur = await _currencyInteractor.eurRate();
    emit(CurrencyRateState(usd: usd, eur: eur));
  }
}

extension CurrencyRateBlocExt on BuildContext {
  double usd() => watch<CurrencyRateBloc>().state.usd;

  double eur() => watch<CurrencyRateBloc>().state.eur;

  Sum fromUsd(int sum) => Sum((sum / usd()).toInt(), Currency.RUB);

  Sum fromEur(int sum) => Sum((sum / eur()).toInt(), Currency.RUB);

  String usdRateFormat() => loc.rateFormat(_rate(usd()));

  String eurRateFormat() => loc.rateFormat(_rate(eur()));

  Sum sumToRub(Sum sum) => switch (sum.currency) {
        Currency.RUB => sum,
        Currency.USD => fromUsd(sum.sum),
        Currency.EUR => fromEur(sum.sum),
      };

  int balanceToRub(Balance balance) => balance.sums
      .map<num>((e) => switch (e.currency) {
            Currency.RUB => e.sum,
            Currency.USD => (e.sum / usd()),
            Currency.EUR => (e.sum / eur()),
          })
      .fold<double>(0, (a, b) => a + b).toInt();

  double _rate(double rate) {
    return ((1 / rate) * 100).floor() / 100;
  }
}
