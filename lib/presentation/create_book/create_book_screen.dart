import 'package:aqtest/core/widget/label.dart';
import 'package:aqtest/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aqtest/core/widget/edittext.dart';
import 'package:aqtest/provider/book/book_provider.dart';

class CreateBookScreen extends StatefulWidget {
  final BookModel? book;

  const CreateBookScreen({super.key, this.book});

  @override
  State<CreateBookScreen> createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  late BookProvider bookProvider;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<BookProvider>(context, listen: false).viewBook(
      book: widget.book,
    );
  }

  @override
  Widget build(BuildContext context) {
    bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (widget.book != null) {
                  bookProvider.updateBook(book: widget.book!);
                } else {
                  bookProvider.createBook();
                }
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Label(text: 'Code', isRequired: true),
                Edittext(
                  controller: bookProvider.state.codeController,
                  onChanged: ((value) => _formKey.currentState!.validate()),
                  enabled: widget.book == null,
                  validator: (val) {
                    if (!val!.isNotEmpty) {
                      return 'Code must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const Label(text: 'ISBN', isRequired: true),
                Edittext(
                  controller: bookProvider.state.isbnController,
                  onChanged: ((value) => _formKey.currentState!.validate()),
                  validator: (val) {
                    if (!val!.isNotEmpty) {
                      return 'ISBN must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const Label(text: 'Title', isRequired: true),
                Edittext(
                  controller: bookProvider.state.titleController,
                  onChanged: ((value) => _formKey.currentState!.validate()),
                  validator: (val) {
                    if (!val!.isNotEmpty) {
                      return 'Title must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const Label(text: 'Description'),
                Edittext(
                  controller: bookProvider.state.descController,
                  onChanged: ((value) => _formKey.currentState!.validate()),
                ),
                const SizedBox(height: 8),
                const Label(text: 'Price', isRequired: true),
                Edittext(
                  controller: bookProvider.state.priceController,
                  onChanged: ((value) => _formKey.currentState!.validate()),
                  inputType: TextInputType.number,
                  validator: (val) {
                    if (!val!.isNotEmpty) {
                      return 'Price must not empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
