import 'package:bovespa/services/bovespa.dart';
import 'package:bovespa/types/stock.dart';
import 'package:bovespa/widgets/stock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ações da Bovespa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ações da Bovespa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum ResultStatus { loading, done, error }

class _MyHomePageState extends State<MyHomePage> {
  final BovespaAPI _bovespaApi = BovespaAPI();

  List<Stock> stocks = [];
  ResultStatus resultStatus;

  void refreshStocks() async {
    setState(() {
      resultStatus = ResultStatus.loading;
    });
    List<Stock> result = await _bovespaApi.fetchStocks();

    setState(() {
      stocks = result;
      resultStatus = ResultStatus.done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('Carregar Ações'),
                  ),
                ),
                onTap: refreshStocks,
              ),
              Expanded(
                child: Container(child: _result),
              )
            ],
          ),
        ));
  }

  Widget get _result {
    if (resultStatus == ResultStatus.loading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        return StockCard(
          stocks[index],
        );
      },
    );
  }
}
