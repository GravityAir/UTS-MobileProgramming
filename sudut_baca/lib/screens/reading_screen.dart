import 'dart:async';
import 'package:flutter/material.dart';
import '../models/book_data.dart';

class ReadingScreen extends StatefulWidget {
  final Book book;
  const ReadingScreen({super.key, required this.book});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final ScrollController _scrollController = ScrollController();
  double progress = 0.0;
  int currentChapter = 0;
  bool showSlider = false;
  Timer? _hideTimer;

  late final List<String> chapters;
  late final List<String> contents;
  late final List<GlobalKey> _chapterKeys;

  @override
  void initState() {
    super.initState();

    chapters = [
      "Bab 1: Pendahuluan",
      "Bab 2: Pembahasan",
      "Bab 3: Kesimpulan",
    ];

    contents = [
      (widget.book.synopsis + "\n\n" + widget.book.description) * 3,
      (widget.book.description + "\n\n") * 6,
      ("Ringkasan akhir tentang ${widget.book.title}. " +
          "Ditulis oleh ${widget.book.author}. " +
          "Buku kategori ${widget.book.category}.") *
          4,
    ];

    _chapterKeys = List.generate(chapters.length, (_) => GlobalKey());

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      final pos = _scrollController.offset;
      setState(() {
        progress = max > 0 ? (pos / max).clamp(0.0, 1.0) : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  Future<void> _goToChapter(int index) async {
    final ctx = _chapterKeys[index].currentContext;
    if (ctx == null) {
      _scrollController.jumpTo(0);
      setState(() => currentChapter = index);
      return;
    }

    setState(() => currentChapter = index);
    Navigator.of(context).maybePop();

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }

  void _showSliderTemporarily() {
    setState(() => showSlider = true);

    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() => showSlider = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    const bookPageColor = Color(0xFFFDF6E3);

    return Scaffold(
      backgroundColor: bookPageColor,
      appBar: AppBar(
        title: Text(widget.book.title, style: const TextStyle(color: Colors.black87)),
        backgroundColor: bookPageColor,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Daftar Bab', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  itemCount: chapters.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        chapters[index],
                        style: TextStyle(
                          color: currentChapter == index ? Colors.blueAccent : Colors.white,
                          fontWeight: currentChapter == index ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () => _goToChapter(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _showSliderTemporarily,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(chapters.length, (i) {
              return Container(
                key: _chapterKeys[i],
                padding: const EdgeInsets.only(bottom: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapters[i],
                      style: const TextStyle(
                        fontFamily: 'serif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      contents[i],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 17,
                        height: 1.6,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),

      bottomNavigationBar: AnimatedOpacity(
        opacity: showSlider ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: showSlider
            ? SizedBox(
          height: 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: progress,
                onChanged: (value) {
                  if (!_scrollController.hasClients) return;
                  final max = _scrollController.position.maxScrollExtent;
                  final target = value * max;
                  _scrollController.jumpTo(target);
                },
              ),
            ],
          ),
        )
            : const SizedBox.shrink(),
      ),
    );
  }
}
