class StackedCardModel {
  final String imageUrl;
  final String title;
  final String buttonText;
  final String location;
  final String price;
  final double rating;
  StackedCardModel(
      {required this.imageUrl,
      required this.price,
      required this.rating,
      required this.location,
      required this.buttonText,
      required this.title});
}
