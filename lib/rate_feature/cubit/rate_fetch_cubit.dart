import 'package:bloc/bloc.dart';

part 'rate_fetch_state.dart';

class RateFetchCubit extends Cubit<RateFetchState> {
  RateFetchCubit() : super(RateFetchInitial());

  Future<void> loading() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    emit(MarketListed(marketListData: ['deriv', 'fayiz']));
  }
}
