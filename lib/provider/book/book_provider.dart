import 'package:flutter/material.dart';
import 'package:aqtest/data/models/book_model.dart';
import 'book_state.dart';

class BookProvider extends ChangeNotifier {
  final state = BookState();

  getBooks() async {
    var books = await state.bookRepository.getBooks();
    state.books = books;
    notifyListeners();
  }

  viewBook({BookModel? book}) {
    state.codeController.text = book?.code ?? '';
    state.isbnController.text = book?.isbn ?? '';
    state.titleController.text = book?.title ?? '';
    state.descController.text = book?.description ?? '';
    state.priceController.text = book?.price.toString() ?? '0';
  }

  createBook() async {
    var newBook = BookModel(
      code: state.codeController.text,
      isbn: state.isbnController.text,
      title: state.titleController.text,
      description: state.descController.text,
      price: int.tryParse(state.priceController.text) ?? 0,
    );
    state.books.add(newBook);
    state.codeController.clear();
    state.isbnController.clear();
    state.titleController.clear();
    state.descController.clear();
    state.priceController.clear();
    notifyListeners();
  }

  updateBook({required BookModel book}) async {
    final index = state.books.indexOf(book);
    final newBook = BookModel(
      code: book.code,
      isbn: state.isbnController.text,
      title: state.titleController.text,
      description: state.descController.text,
      price: int.tryParse(state.priceController.text) ?? 0,
    );
    state.books[index] = newBook;
    state.codeController.clear();
    state.isbnController.clear();
    state.titleController.clear();
    state.descController.clear();
    state.priceController.clear();
    notifyListeners();
  }

  deleteBook(int index) async {
    state.books.removeAt(index);
    notifyListeners();
  }
}
