part of 'rate_fetch_cubit.dart';

abstract class RateFetchState {}

class RateFetchInitial extends RateFetchState {}

class MarketListed extends RateFetchState {
  MarketListed({required this.marketListData});

  List<String> marketListData = [];
}
