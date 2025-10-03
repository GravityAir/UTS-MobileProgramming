import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  // Tambahkan variabel untuk menampung kategori yang dipilih
  final List<String> selectedCategories;

  const MainScreen({super.key, required this.selectedCategories});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    // Inisialisasi halaman dengan meneruskan daftar kategori
    _widgetOptions = <Widget>[
      HomeScreen(selectedCategories: widget.selectedCategories),
      SearchScreen(selectedCategories: widget.selectedCategories),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... sisa kode build method tidak berubah ...
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudut Baca'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Rekomendasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pencarian'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1F1F1F),
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}