import 'package:flutter/material.dart';

class EthnicProduct {
  final int id, price;
  final String title, image;

  EthnicProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our

List<EthnicProduct> ethnicProducts = [
  EthnicProduct(
    id: 1,
    image: 'assets/products/ethnic/Ch_2.png',
    title: "ethnic 1",
    price: 1000,
  ),
  EthnicProduct(
    id: 2,
    image: "assets/products/ethnic/Ch_2.png",
    title: "ethnic 2",
    price: 999,
  ),
  EthnicProduct(
    id: 3,
    image: "assets/products/ethnic/Ch_2.png",
    title: "ethnic 3",
    price: 950,
  ),
  EthnicProduct(
    id: 4,
    image: "assets/products/ethnic/Ch_2.png",
    title: "ethnic 4",
    price: 950,
  ),
];
