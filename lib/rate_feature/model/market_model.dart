// To parse this JSON data, do
//
//     final market = marketFromJson(jsonString);
import 'dart:convert';

Market marketFromJson(String str) =>
    Market.fromJson(json.decode(str) as Map<String, Iterable<dynamic>>);

String marketToJson(Market data) => json.encode(data.toJson());

class Market {
  Market({
    required this.activeSymbols,
  });

  List<ActiveSymbol> activeSymbols;

  factory Market.fromJson(Map<String, Iterable<dynamic>> json) => Market(
        activeSymbols: List<ActiveSymbol>.from(
          json['active_symbols']!.map(
            (x) => ActiveSymbol.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'active_symbols':
            List<dynamic>.from(activeSymbols.map((x) => x.toJson())),
      };
}

class ActiveSymbol {
  ActiveSymbol({
    required this.allowForwardStarting,
    required this.displayName,
    required this.displayOrder,
    required this.exchangeIsOpen,
    required this.isTradingSuspended,
    required this.market,
    required this.marketDisplayName,
    required this.pip,
    required this.subgroup,
    required this.subgroupDisplayName,
    required this.submarket,
    required this.submarketDisplayName,
    required this.symbol,
    required this.symbolType,
  });

  int allowForwardStarting;
  String displayName;
  int displayOrder;
  int exchangeIsOpen;
  int isTradingSuspended;
  String market;
  String marketDisplayName;
  double pip;
  String subgroup;
  String subgroupDisplayName;
  String submarket;
  String submarketDisplayName;
  String symbol;
  String symbolType;

  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: json['allow_forward_starting'] as int,
        displayName: json['display_name'] as String,
        displayOrder: json['display_order'] as int,
        exchangeIsOpen: json['exchange_is_open'] as int,
        isTradingSuspended: json['is_trading_suspended'] as int,
        market: json['market'] as String,
        marketDisplayName: json['market_display_name'] as String,
        pip: json['pip'].toDouble() as double,
        subgroup: json['subgroup'] as String,
        subgroupDisplayName: json['subgroup_display_name'] as String,
        submarket: json['submarket'] as String,
        submarketDisplayName: json['submarket_display_name'] as String,
        symbol: json['symbol'] as String,
        symbolType: json['symbol_type'] as String,
      );

  Map<String, dynamic> toJson() => {
        'allow_forward_starting': allowForwardStarting,
        'display_name': displayName,
        'display_order': displayOrder,
        'exchange_is_open': exchangeIsOpen,
        'is_trading_suspended': isTradingSuspended,
        'market': market,
        'market_display_name': marketDisplayName,
        'pip': pip,
        'subgroup': subgroup,
        'subgroup_display_name': subgroupDisplayName,
        'submarket': submarket,
        'submarket_display_name': submarketDisplayName,
        'symbol': symbol,
        'symbol_type': symbolType,
      };
}
