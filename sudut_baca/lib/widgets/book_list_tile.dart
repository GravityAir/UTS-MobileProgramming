import 'package:flutter/material.dart';
import '../models/book_data.dart';
import '../screens/book_detail_screen.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  const BookListTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      // Card color sudah diatur di main.dart
      child: ListTile(
        leading: ClipRRect( // Tambahkan ClipRRect agar gambar punya border radius
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            book.imageUrl,
            width: 60, // Perbesar sedikit
            height: 80, // Perbesar sedikit
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 60,
              height: 80,
              color: colorScheme.surface,
              child: Center(
                child: Icon(Icons.image_not_supported, color: colorScheme.onSurface.withOpacity(0.5), size: 30),
              ),
            ),
          ),
        ),
        title: Text(book.title, style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.author, style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7))),
            Text('Rp ${book.price.toStringAsFixed(0)}', style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold)),
          ],
        ),
        isThreeLine: true, // Pastikan subtitle bisa 2 baris
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(book: book)));
        },
      ),
    );
  }
}