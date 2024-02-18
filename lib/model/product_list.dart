import 'package:json_annotation/json_annotation.dart';
part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  @JsonKey(name: 'Product Id')
  final int productID;
  @JsonKey(name: 'Product Name')
  final String productName;
  @JsonKey(name: 'Product Description')
  final String productDesc;
  @JsonKey(name: 'Image Url')
  final String imageUrl;
  @JsonKey(name: 'Price')
  final int? price;
  @JsonKey(name: 'availableQuantity')
  final int? availableQuan;

  ProductList(
      this.productID,
       this.productName, this.productDesc, this.imageUrl, this.price, this.availableQuan,
      );

  factory ProductList.fromJson(Map<String, dynamic> json) {
    return _$ProductListFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ProductListToJson(this);
  }
}