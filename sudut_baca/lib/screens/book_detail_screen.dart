import 'package:flutter/material.dart';
import '../models/book_data.dart';
import 'checkout_screen.dart';
import 'synopsis_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(book.imageUrl, height: 250, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(book.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorScheme.onBackground), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text('oleh ${book.author}', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorScheme.onBackground.withOpacity(0.7))),
            const SizedBox(height: 8),
            Chip(label: Text(book.category)),
            const SizedBox(height: 20),
            Text(
              'Harga: Rp ${book.price.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
            ),
            const SizedBox(height: 20),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.onBackground.withOpacity(0.9)),
            ),
            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.chrome_reader_mode_outlined),
              label: const Text('Baca Online'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SynopsisScreen(book: book),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text('Pemesanan Buku Fisik'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(book: book),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}