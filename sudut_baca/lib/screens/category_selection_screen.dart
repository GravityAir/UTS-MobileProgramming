import 'package:flutter/material.dart';
import '../models/book_data.dart'; // Diperlukan untuk dummyBooks
import 'main_screen.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  final Map<String, IconData> _categoryData = {
    'Pengembangan Diri': Icons.self_improvement, // Ganti ikon agar lebih spesifik
    'Pendidikan': Icons.menu_book, // Ganti ikon
    'Novel': Icons.book, // Ganti ikon
    'Ekonomi': Icons.currency_exchange, // Ganti ikon
  };

  final Set<String> _selectedCategories = {};

  void _toggleCategory(String category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  void _navigateToMainScreen() {
    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap pilih minimal satu kategori.'),
          // Warna Snackbar sudah diatur di main.dart
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(
            selectedCategories: _selectedCategories.toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // Ambil colorScheme dari tema

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorScheme.onBackground),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pilih kategori buku yang Anda minati.',
                    style: TextStyle(fontSize: 16, color: colorScheme.onBackground.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: _categoryData.length,
                itemBuilder: (context, index) {
                  final category = _categoryData.keys.elementAt(index);
                  final icon = _categoryData.values.elementAt(index);
                  final isSelected = _selectedCategories.contains(category);

                  return Card(
                    // Gunakan warna dari colorScheme
                    color: isSelected ? colorScheme.primary : colorScheme.surface,
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: isSelected
                          ? BorderSide(color: colorScheme.onPrimary, width: 2)
                          : BorderSide.none,
                    ),
                    child: InkWell(
                      onTap: () => _toggleCategory(category),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: _navigateToMainScreen,
                // Gaya tombol sudah diatur di main.dart
                child: const Text('Lanjutkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}