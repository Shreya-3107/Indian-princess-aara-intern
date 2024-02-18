import 'package:flutter/material.dart';

class SalwarProduct {
  final int id, price;
  final String title, image;

  SalwarProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our  Products

List<SalwarProduct> salwarProducts = [
  SalwarProduct(
    id: 1,
    image: 'assets/products/Salwar/Salwar_Suit.png',
    title: "Salwar 1",
    price: 1650,
  ),
  SalwarProduct(
    id: 2,
    image: "assets/products/Salwar/Salwar_Suit.png",
    title: "Salwar 2",
    price: 1500,
  ),
  SalwarProduct(
    id: 3,
    image: "assets/products/Salwar/Salwar_Suit.png",
    title: "Salwar 3",
    price: 1450,
  ),
  SalwarProduct(
    id: 4,
    image: "assets/products/Salwar/Salwar_Suit.png",
    title: "Salwar 4",
    price: 1300,
  ),
];
