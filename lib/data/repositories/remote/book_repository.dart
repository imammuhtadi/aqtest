import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:aqtest/data/models/book_model.dart';

class BookRepository {
  Future<List<BookModel>> getBooks() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    return List<BookModel>.from(data.map((x) => BookModel.fromJson(x)));
  }
}
