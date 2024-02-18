import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:indian_princess_web_app/model/product_list.dart';

import '../http_client.dart';


class ProductAPI {
  HttpClientAPI httpClient = HttpClientAPI();

  Future<List<ProductList>> getProducts() async {
    var response = await httpClient.get(
        endpoint: "product/getProduct?ai_product_id=0");

    if (response.statusCode == 200) {
      List<dynamic> productResponse = json.decode(response.toString());
      if (productResponse.isNotEmpty) {
        print("result:${productResponse}");
        List<dynamic> dataList = [];
        if (productResponse[0] is List<dynamic>) {
          dataList = productResponse[0] as List;
        } else {
          dataList = productResponse;
        }
        List<ProductList> countries = dataList
            .map((productJson) => ProductList.fromJson(productJson))
            .toList();
        return countries;
      }
    }
    return [];
  }

  Future<bool> addProduct({required Product product}) async {
    Map<String, dynamic> data = {
      "product_name": product.name,
      "product_description": product.desc,
      "price": product.price,
      "availableQuantity": product.quantity

    };
    print("$data");
    var response =
    await httpClient.post(endpoint: "product/addProduct", body: data);
    print("response$response");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> editProduct(
      {required Product product, required String productId}) async {
    Map<String, dynamic> data = {
      "product_name": product.name,
      "product_description": product.desc,
      "product_id": productId,
      "availableQuantity": product.quantity,
      "price": product.price
    };
    print("$data");
    var response =
    await httpClient.put(endpoint: "product/updateProduct", body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> deleteProduct({required String productId}) async {
    Map<String, dynamic> data = {"Product Id": productId};
    var response = await httpClient.delete(endpoint: "delete", body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }
}

class Product {
  final String name;
  final String desc;
  final String? price;
  final String? quantity;
  final ProductStatus status;

  Product(this.quantity,  {required this.name, required this.desc, required this.status, this.price,});
}

enum ProductStatus { none, active, inactive }
