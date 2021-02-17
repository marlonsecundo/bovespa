class Stock {
  Stock.fromJSON(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    companyName = json["company_name"];
    document = json["document"];
    description = json["description"];
    website = json["website"];
    region = json["region"];
    currency = json["currency"];
    marketTime = json["market_time"];
    marketCap = json["market_cap"];
    price = json["price"];
    changePercent = json["change_percent"];
    updatedAt = json["updated_at"];
  }

  String symbol;
  String name;
  String companyName;
  String document;
  String description;
  String website;
  String region;
  String currency;
  dynamic marketTime;
  double marketCap;
  double price;
  double changePercent;
  String updatedAt;
}
