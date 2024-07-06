import 'package:hngt2/dio_provider.dart';
import 'package:hngt2/models/product/product.dart';
import 'package:hngt2/secrets.dart';

class ProductRepo {
  static Future<List<Product>> getProducts() async {
    List<Product> products = [];

    try {
      final res = await DioProvider().get('products', query: {
        "Appid": AppSecrets.appId,
        "Apikey": AppSecrets.apiKey,
        "organization_id": AppSecrets.organizationId
      });
      if (res == null) return products;
      final serverProducts = res.data["items"] as List;
      products = serverProducts.map((e) => Product.fromJson(e)).toList();
      return products;
    } catch (e) {
      print(e);
      return products;
    }
  }
}
