
class TrendingItems {
  final int id, price;
  final String title, image;

  TrendingItems({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our trending Products

List<TrendingItems> trendingItems = [
  TrendingItems(
    id: 1,
    image: 'assets/products/ethnic/Ch_2.png',
    title: "Ethnic",
    price: 650,
  ),
  TrendingItems(
    id: 2,
    image: "assets/products/Salwar/Salwar_Suit.png",
    title: "SalwarSuit",
    price: 1600,
  ),
  TrendingItems(
    id: 3,
    image: "assets/products/kurtas/Top_Suit.png",
    title: "Kurtas",
    price: 4500,
  ),
  TrendingItems(
    id: 4,
    image: "assets/products/kurtas/Top_Suit.png",
    title: "Kurtas",
    price: 3600,
  ),
];