class ProductModel {
  final String image;
  final String title;
  final num price;
  final num discount; 
  final String count;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'discount': discount,
      'count': count,
    };
  }

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'],
      title: map['title'],
      price: map['price'],
      discount: map['discount'],
      count: map['count'],
    );
  }
}