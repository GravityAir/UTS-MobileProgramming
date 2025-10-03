import 'package:flutter/material.dart';
import '../models/book_data.dart';
import '../widgets/book_list_tile.dart';

class SearchScreen extends StatefulWidget {
  final List<String> selectedCategories;
  const SearchScreen({super.key, required this.selectedCategories});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Book> _foundBooks = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foundBooks = dummyBooks; // Cari dari semua buku
  }

  void _runFilter(String enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword.isEmpty) {
      results = dummyBooks;
    } else {
      results = dummyBooks
          .where((book) =>
      book.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
          book.author.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
          book.category.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() => _foundBooks = results);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) => _runFilter(value),
            // Gaya input sudah diatur di main.dart
            decoration: const InputDecoration(
              labelText: 'Cari judul, pengarang, atau kategori...',
              prefixIcon: Icon(Icons.search), // Gunakan prefixIcon agar lebih konsisten
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _foundBooks.isNotEmpty
                ? ListView.builder(
              itemCount: _foundBooks.length,
              itemBuilder: (context, index) => BookListTile(book: _foundBooks[index]),
            )
                : Center(
              child: Text(
                'Buku tidak ditemukan.',
                style: TextStyle(color: colorScheme.onBackground.withOpacity(0.7)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}