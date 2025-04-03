import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';

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
  final DataRepository _dataRepository;

  CurrencyRateBloc(this._dataRepository)
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
    final usd = await _dataRepository.usdRate();
    final eur = await _dataRepository.eurRate();
    emit(CurrencyRateState(usd: usd, eur: eur));
  }
}

extension CurrencyRateBlocExt on BuildContext{
  double usd() => watch<CurrencyRateBloc>().state.usd;

  double eur() => watch<CurrencyRateBloc>().state.eur;
}