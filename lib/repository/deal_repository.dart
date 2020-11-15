import 'package:SMSAndroid/models/deal.dart';
import 'package:http/http.dart' as http;

class DealRepository {
  static String mainUrl = "https://mysmsapi.azurewebsites.net/api/v1.0";
  var dealUrl = "$mainUrl/ProductsCategory";
  Future<Deal> createDeal(Deal deal) {
    return null;
  }
}
