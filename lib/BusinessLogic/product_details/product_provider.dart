import 'package:flutter/material.dart';
import '../../Utils/constants.dart';
import '../../json_model_sample/products_list.dart';
import '../../model/product_list.dart';
import '../../network/product_details/product_network.dart';



class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;
  String searchString = "";
  late List<ProductList> productList=[];
  List<ProductList> productWithFilter = [];
  final ProductAPI _productAPI = ProductAPI();

  getProducts() async {
    isLoading = true;
   // notifyListeners();
    try {
      if (isSampleDataMode) {
        List<Map<String, dynamic>> productResponse = productJson["response"];
        productList =
            productResponse.map((e) => ProductList.fromJson(e)).toList();
      } else {
        productList = (await _productAPI.getProducts());

      }
      getFilteredProductList();
    }
    catch (err) {

      print("error t: $err");
      isLoading = false;
      isError = true;
      errorMessage = err.toString();
      notifyListeners();
    }
  }

  searchProduct({required String searchText}) {
    print("search string before: $searchString");
    searchString = searchText;
    print("search string: $searchString");
    getFilteredProductList();
  }

  getFilteredProductList() {
    productWithFilter = [];
    if (searchString.isEmpty) {
      productWithFilter = productList;
    } else {
      productWithFilter = productList
          .where((e) =>
      e.productID
          .toString()
          .toLowerCase()
          .contains(searchString.toLowerCase()) ||
          e.productName
              .toLowerCase()
              .contains(searchString.toLowerCase()) ||
          e.productDesc
              .toLowerCase()
              .contains(searchString.toLowerCase()) ||
          e.price != null && e.price!.toString().toLowerCase().contains(searchString.toLowerCase()) ||
          (e.availableQuan != null &&
              e.availableQuan!.toString()
                  .toLowerCase()
                  .contains(searchString.toLowerCase()))

                            )
          .toList();
    }
    isLoading = false;
    isError = false;
    notifyListeners();
  }
}

