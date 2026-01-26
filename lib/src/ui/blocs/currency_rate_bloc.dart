import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/currency_interactor.dart';
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
abstract class CurrencyRateState with _$CurrencyRateState {
  const CurrencyRateState._();

  const factory CurrencyRateState({required double usd, required double eur}) =
      _CurrencyRateState;
}

class CurrencyRateBloc extends Bloc<CurrencyRateEvent, CurrencyRateState> {
  final CurrencyInteractor _currencyInteractor;

  CurrencyRateBloc(this._currencyInteractor)
    : super(const CurrencyRateState(usd: 1, eur: 1)) {
    on<CurrencyRateEvent>(
      (event, emit) => event.map(
        fetch: (event) => _onFetch(event, emit),
        change: (event) =>
            emit(CurrencyRateState(usd: event.usd, eur: event.eur)),
      ),
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
  double _usd() => watch<CurrencyRateBloc>().state.usd;

  double _eur() => watch<CurrencyRateBloc>().state.eur;

  double _rate(Currency currency) => switch (currency) {
    Currency.RUB => 1,
    Currency.USD => _usd(),
    Currency.EUR => _eur(),
  };

  String formatedRate(Currency currency) {
    return loc.rateFormat(((1 / _rate(currency)) * 100).floor() / 100);
  }

  Sum sumToRub(Sum sum) => Sum((sum.sum / _rate(sum.currency)).toInt(), .RUB);

  Sum balanceToRub(Balance balance) => balance.sums
      .map((e) => sumToRub(e).sum)
      .fold<Sum>(Sum(0, .RUB), (a, b) => a + b);
}
