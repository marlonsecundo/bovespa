import 'package:bovespa/types/stock.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  StockCard(this.stock);

  final Stock stock;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(stock.companyName),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Símbolo: ' + stock.symbol),
                Text('Moeda: ' + stock.currency),
                Text('Valor: ' + stock.price.toString()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(stock.website),
          ),
        ],
      ),
    );
  }
}
