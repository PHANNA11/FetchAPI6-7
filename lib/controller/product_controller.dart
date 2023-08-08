import 'package:http/http.dart' as http;
import 'package:simple_api/model/product_model.dart';

class ProductController {
  Future getProduct() async {
    var url = 'https://api.escuelajs.co/api/v1/products';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    }
    return [];
  }
}
