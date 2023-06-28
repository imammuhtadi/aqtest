import 'package:aqtest/presentation/create_book/create_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aqtest/provider/book/book_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BookProvider bookProvider;

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Provider.of<BookProvider>(context, listen: false).getBooks();
  }

  Future<dynamic> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    return bookProvider.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const CreateBookScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: ListView.separated(
          itemCount: bookProvider.state.books.length,
          separatorBuilder: ((context, index) {
            return const Divider(height: 1);
          }),
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CreateBookScreen(
                      book: bookProvider.state.books[index],
                    ),
                  ),
                );
              },
              title: Text(bookProvider.state.books[index].title),
              trailing: IconButton(
                onPressed: () {
                  bookProvider.deleteBook(index);
                },
                icon: const Icon(Icons.delete_outlined, color: Colors.red),
              ),
            );
          }),
        ),
      ),
    );
  }
}
