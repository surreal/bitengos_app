class ProductModel {
  final String title;
  final double duration;
  final String imageUrl;

  ProductModel({
    this.title,
    this.duration,
    this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        duration = map['duration'],
        imageUrl = map['imageUrl'];
}
