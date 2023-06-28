class BookModel {
  late String code;
  late String isbn;
  late String title;
  String? description;
  String? category;
  String? publishDate;
  late int price;
  bool? hardCover;

  BookModel({
    required this.code,
    required this.isbn,
    required this.title,
    this.description,
    this.category,
    this.publishDate,
    required this.price,
    this.hardCover,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    isbn = json['isbn'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    publishDate = json['publish_date'];
    price = json['price'];
    hardCover = json['hard_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['isbn'] = isbn;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['publish_date'] = publishDate;
    data['price'] = price;
    data['hard_cover'] = hardCover;
    return data;
  }
}
