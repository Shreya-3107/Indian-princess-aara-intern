import 'package:flutter/material.dart';

class KurtaSetProduct {
  final int id, price;
  final String title, image;

  KurtaSetProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our

List<KurtaSetProduct> kurtasetProducts = [
  KurtaSetProduct(
    id: 1,
    image: 'assets/products/kurtas/kurtas.gif',
    title: "kurtas 1",
    price: 399,
  ),
  KurtaSetProduct(
    id: 2,
    image: "assets/products/kurtas/Top_Suit.png",
    title: "kurtas 2",
    price: 500,
  ),
  KurtaSetProduct(
    id: 3,
    image: "assets/products/kurtas/Top_Suit.png",
    title: "kurtas 3",
    price: 650,
  ),
  KurtaSetProduct(
    id: 4,
    image: "assets/products/kurtas/Top_Suit.png",
    title: "kurtas 4",
    price: 700,
  ),
];
