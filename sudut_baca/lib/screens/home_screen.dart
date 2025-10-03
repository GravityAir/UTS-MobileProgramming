import 'package:flutter/material.dart';
import '../models/book_data.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  final List<String> selectedCategories;
  const HomeScreen({super.key, required this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final displayedBooks = dummyBooks
        .where((book) => selectedCategories.contains(book.category))
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          '📚 Rekomendasi Buku Untuk Anda',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorScheme.onBackground),
        ),
        const SizedBox(height: 16),
        if (displayedBooks.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Tidak ada buku yang cocok dengan kategori pilihan Anda.',
                style: TextStyle(color: colorScheme.onBackground.withOpacity(0.7)),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              // =========================================================
              // PERUBAHAN DI SINI: Sesuaikan childAspectRatio
              // Membuat kartu lebih tinggi, jadi gambar lebih banyak ruang
              childAspectRatio: 0.55, // Contoh: (Lebar 0.55 dari Tinggi)
              // =========================================================
            ),
            itemCount: displayedBooks.length,
            itemBuilder: (context, index) => BookCard(book: displayedBooks[index]),
          ),
      ],
    );
  }
}