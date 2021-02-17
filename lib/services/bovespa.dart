import 'package:bovespa/types/stock.dart';
import 'package:dio/dio.dart';

class BovespaAPI {
  BovespaAPI() {
    _dio = new Dio(BaseOptions(
      baseUrl: _url,
    ));
  }

  final int _key = 37588573;
  final String _url = 'https://api.hgbrasil.com/finance/';
  final List<String> _symbols = ['bidi4', 'petr4', 'qual3', 'ciel3'];
  Dio _dio;

  Future<List<Stock>> fetchStocks() async {
    List<Stock> stocks = [];

    for (String symbol in _symbols) {
      Response response = await _dio.get(
          'https://api.hgbrasil.com/finance/stock_price?key=$_key&symbol=$symbol');

      Map<String, dynamic> jsonResult = response.data['results'];

      stocks.add(Stock.fromJSON(jsonResult.values.first));
    }

    return stocks;
  }
}
