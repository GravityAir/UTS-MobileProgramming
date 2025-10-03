class Book {
  final int id;
  final String title;
  final String author;
  final String category;
  final String imageUrl;
  final String description;
  final int price; // <-- TAMBAHKAN PROPERTI HARGA

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.price, // <-- TAMBAHKAN DI KONSTRUKTOR
  });
}

final List<Book> dummyBooks = [
  // --- Kategori: Pengembangan Diri ---
  Book(
      id: 1,
      title: 'Atomic Habits',
      author: 'James Clear',
      category: 'Pengembangan Diri',
      imageUrl: 'https://gpu.id/data-gpu/images/img-book/93953/623221001.jpg',
      description: 'Sebuah metode yang mudah dan terbukti untuk membangun kebiasaan baik dan menghilangkan kebiasaan buruk. Pelajari cara membuat perubahan kecil yang akan memberikan hasil luar biasa.',
      price: 108000
  ),
  Book(
      id: 2,
      title: 'Filosofi Teras',
      author: 'Henry Manampiring',
      category: 'Pengembangan Diri',
      imageUrl: 'https://cdn.gramedia.com/uploads/picture_meta/2023/11/27/kjf6cgigkomf6sy9o5qauu.jpg',
      description: 'Sebuah pengantar filsafat Stoisisme kuno yang relevan untuk mengatasi emosi negatif dan hidup dengan tenang di tengah tantangan zaman modern.',
      price: 98000
  ),

  // --- Kategori: Pendidikan ---
  Book(
      id: 3,
      title: 'Sapiens: A Brief History of Humankind',
      author: 'Yuval Noah Harari',
      category: 'Pendidikan',
      imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1420585954l/23692271._SY475_.jpg',
      description: 'Menelusuri sejarah umat manusia, dari zaman batu hingga revolusi kognitif, agrikultur, dan sains, serta bagaimana Homo Sapiens berhasil mendominasi planet ini.',
      price: 149000
  ),

  // --- Kategori: Novel ---
  Book(
      id: 4,
      title: 'Laskar Pelangi',
      author: 'Andrea Hirata',
      category: 'Novel',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1489732961i/1362193.jpg',
      description: 'Kisah inspiratif tentang sepuluh anak dari keluarga miskin yang bersekolah di sebuah sekolah Muhammadiyah di Belitung yang penuh dengan keterbatasan namun memiliki semangat juang tinggi.',
      price: 89000
  ),
  Book(
      id: 5,
      title: 'Bumi Manusia',
      author: 'Pramoedya Ananta Toer',
      category: 'Novel',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1565658920i/1398034.jpg',
      description: 'Bagian pertama dari Tetralogi Buru, novel ini menceritakan kisah Minke, seorang pribumi Jawa di awal abad ke-20, yang berjuang dengan identitasnya di tengah era kolonialisme Belanda.',
      price: 150000
  ),

  // --- Kategori: Ekonomi ---
  Book(
      id: 6,
      title: 'Rich Dad Poor Dad',
      author: 'Robert T. Kiyosaki',
      category: 'Ekonomi',
      imageUrl: 'https://cdn.gramedia.com/uploads/items/9786020333175_rich-dad-poor-dad-_edisi-revisi_.jpg',
      description: 'Buku ini mengajarkan tentang kecerdasan finansial (financial literacy) melalui perbandingan dua figur ayah dengan perspektif berbeda mengenai uang dan investasi.',
      price: 95000
  ),
];