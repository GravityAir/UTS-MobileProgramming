import 'package:flutter/material.dart';
// Hapus import package google_fonts
import '../models/book_data.dart';

class ReadingScreen extends StatelessWidget {
  final Book book;
  const ReadingScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    const bookPageColor = Color(0xFFFDF6E3);

    return Scaffold(
      backgroundColor: bookPageColor,
      appBar: AppBar(
        title: Text(book.title, style: const TextStyle(color: Colors.black87)),
        backgroundColor: bookPageColor,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bab 1: Pendahuluan',
              // =========================================================
              // PERUBAHAN DI SINI: Kembali ke TextStyle biasa
              // =========================================================
              style: const TextStyle(
                fontFamily: 'serif', // Mencoba menggunakan font serif bawaan sistem
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${book.description}\n\n' * 15,
              textAlign: TextAlign.justify,
              // =========================================================
              // PERUBAHAN DI SINI: Kembali ke TextStyle biasa
              // =========================================================
              style: TextStyle(
                fontFamily: 'serif', // Mencoba menggunakan font serif bawaan sistem
                fontSize: 17,
                height: 1.6,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}