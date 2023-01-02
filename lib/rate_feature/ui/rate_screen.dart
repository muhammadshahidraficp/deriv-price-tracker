import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:rateapp/rate_feature/rate_feature.dart';
import 'package:rateapp/rate_feature/widget/drop_menu.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RateFetchCubit>(
      create: (context) => RateFetchCubit()..loading(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: BlocBuilder<RateFetchCubit, RateFetchState>(
            builder: (context, state) {
              if (state is RateFetchInitial) {
                return Container();
              }
              return AppBar(
                centerTitle: true,
                title: const Text('Price Tracker'),
              );
            },
          ),
        ),
        body: BlocBuilder<RateFetchCubit, RateFetchState>(
          builder: (context, state) {
            if (state is RateFetchInitial) {
              return const SpinKitFadingCircle(
                color: Colors.grey,
                size: 50.0,
              );
            } else if (state is MarketListed) {
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: DropWiget(
                        currentValue: state.marketListData.first,
                        items: state.marketListData),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: DropWiget(
                        currentValue: state.marketListData.first,
                        items: state.marketListData),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
