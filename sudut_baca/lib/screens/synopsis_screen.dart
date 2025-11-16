import 'package:flutter/material.dart';
import '../models/book_data.dart';
import 'reading_screen.dart';

class SynopsisScreen extends StatelessWidget {
  final Book book;
  const SynopsisScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Sinopsis Buku')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                book.imageUrl,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'oleh ${book.author}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: colorScheme.onBackground.withOpacity(0.7)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  book.synopsis,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.menu_book),
              label: const Text('Mulai Membaca'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadingScreen(book: book),
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
