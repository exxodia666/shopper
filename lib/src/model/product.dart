class Product {
  Product(
      {required this.image,
      required this.title,
      required this.price,
      this.rating,
      this.description});
  String title;
  String image;
  String price;
  String? description;
  int? rating;
}
