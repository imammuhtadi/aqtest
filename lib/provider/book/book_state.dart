import 'package:aqtest/data/repositories/remote/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:aqtest/data/models/book_model.dart';

class BookState {
  var bookRepository = BookRepository();

  var books = <BookModel>[];

  var codeController = TextEditingController();
  var isbnController = TextEditingController();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var priceController = TextEditingController();
  
  BookState() {
    // constructor
  }
}
