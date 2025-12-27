class PlaceModel {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> services;
  final List<String> offers;
  final String categoryId;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.services,
    required this.offers,
    required this.categoryId,
  });
}
