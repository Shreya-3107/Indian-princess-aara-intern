// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
  json['Product Id'] as int,
  json['Product Name'] as String,
  json['Product Description'] as String,
  json['Image Url'] as String,
  json['Price'] as int?,
  json['availableQuantity'] as int?,

);

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'Product Id': instance.productID,
      'Product Name': instance.productName,
      'Product Description': instance.productDesc,
      'Image Url': instance.imageUrl,
      'Price': instance.price,
      'availableQuantity': instance.availableQuan,
    };
