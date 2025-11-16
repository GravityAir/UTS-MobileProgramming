class Book {
  final int id;
  final String title;
  final String author;
  final String category;
  final String imageUrl;
  final String description;
  final int price;
  final String synopsis;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.synopsis,
  });
}

final List<Book> dummyBooks = [
  // Kategori: Pengembangan Diri
  Book(
      id: 1,
      title: 'Atomic Habits',
      author: 'James Clear',
      category: 'Pengembangan Diri',
      imageUrl: 'https://gpu.id/data-gpu/images/img-book/93953/623221001.jpg',
      description: 'Sebuah metode yang mudah dan terbukti untuk membangun kebiasaan baik dan menghilangkan kebiasaan buruk. Pelajari cara membuat perubahan kecil yang akan memberikan hasil luar biasa.',
      price: 108000,
      synopsis: 'Atomic Habits mengajarkan bahwa perubahan besar tidak harus dimulai dari langkah besar, tetapi dari kebiasaan kecil yang dilakukan secara konsisten. Buku ini membantu pembaca memahami bagaimana otak bekerja dalam membentuk perilaku dan bagaimana sistem kebiasaan bisa diatur agar mendukung kesuksesan jangka panjang. James Clear menjelaskan empat hukum utama pembentukan kebiasaan: menjadikannya jelas, menarik, mudah, dan memuaskan. Dengan berbagai contoh nyata dari atlet, profesional, hingga perusahaan besar, pembaca diajak membangun rutinitas produktif yang menghasilkan kemajuan luar biasa dari waktu ke waktu. Buku ini menjadi panduan praktis untuk siapa pun yang ingin memperbaiki hidup tanpa harus mengubah semuanya sekaligus.',
  ),
  Book(
      id: 2,
      title: 'Filosofi Teras',
      author: 'Henry Manampiring',
      category: 'Pengembangan Diri',
      imageUrl: 'https://cdn.gramedia.com/uploads/picture_meta/2023/11/27/kjf6cgigkomf6sy9o5qauu.jpg',
      description: 'Sebuah pengantar filsafat Stoisisme kuno yang relevan untuk mengatasi emosi negatif dan hidup dengan tenang di tengah tantangan zaman modern.',
      price: 98000,
      synopsis: 'Filosofi Teras membawa kembali ajaran Stoisisme ke dalam kehidupan modern dengan cara yang sederhana dan mudah dipahami. Henry Manampiring menjelaskan bahwa kebahagiaan tidak berasal dari hal eksternal, melainkan dari cara kita memaknai hidup dan mengendalikan pikiran sendiri. Buku ini membantu pembaca belajar membedakan hal-hal yang bisa dan tidak bisa dikendalikan, serta bagaimana menghadapi kekecewaan, kemarahan, dan stres tanpa kehilangan ketenangan. Dengan gaya penulisan ringan dan penuh humor khas Indonesia, Filosofi Teras menjadi panduan berpikir rasional dan emosional untuk hidup yang lebih damai di tengah hiruk-pikuk zaman modern.',
  ),

  // Kategori: Pendidikan
  Book(
      id: 3,
      title: 'Sapiens: A Brief History of Humankind',
      author: 'Yuval Noah Harari',
      category: 'Pendidikan',
      imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1420585954l/23692271._SY475_.jpg',
      description: 'Menelusuri sejarah umat manusia, dari zaman batu hingga revolusi kognitif, agrikultur, dan sains, serta bagaimana Homo Sapiens berhasil mendominasi planet ini.',
      price: 149000,
      synopsis: 'Sapiens menelusuri perjalanan panjang Homo sapiens dari makhluk biasa menjadi spesies paling dominan di bumi. Yuval Noah Harari dengan gaya berpikir kritis mengajak pembaca memahami bagaimana imajinasi kolektif seperti agama, uang, dan pemerintahan membentuk dunia modern. Buku ini membuka wawasan bahwa keberhasilan manusia bukan hanya karena kecerdasan biologis, tetapi karena kemampuan untuk bekerja sama dalam jumlah besar melalui kepercayaan bersama. Dengan bahasa yang tajam dan reflektif, Harari menantang pembaca untuk merenungkan kembali makna kemajuan, kebudayaan, dan masa depan umat manusia.',
  ),

  // Kategori: Novel
  Book(
      id: 4,
      title: 'Laskar Pelangi',
      author: 'Andrea Hirata',
      category: 'Novel',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1489732961i/1362193.jpg',
      description: 'Kisah inspiratif tentang sepuluh anak dari keluarga miskin yang bersekolah di sebuah sekolah Muhammadiyah di Belitung yang penuh dengan keterbatasan namun memiliki semangat juang tinggi.',
      price: 89000,
      synopsis: 'Laskar Pelangi adalah kisah penuh haru dan semangat tentang sekelompok anak miskin di Belitung Timur yang tak pernah menyerah untuk mendapatkan pendidikan. Andrea Hirata menggambarkan perjuangan mereka dengan gaya penceritaan yang puitis dan menyentuh hati. Kisah ini mengajarkan arti ketekunan, keberanian, dan pentingnya guru yang berdedikasi dalam membentuk masa depan murid-muridnya. Setiap halaman membawa pesan tentang harapan, persahabatan, dan keyakinan bahwa mimpi besar bisa lahir dari tempat paling sederhana. Laskar Pelangi bukan hanya novel, tetapi juga refleksi sosial tentang pentingnya pendidikan dan kemanusiaan.',
  ),
  Book(
      id: 5,
      title: 'Bumi Manusia',
      author: 'Pramoedya Ananta Toer',
      category: 'Novel',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1565658920i/1398034.jpg',
      description: 'Bagian pertama dari Tetralogi Buru, novel ini menceritakan kisah Minke, seorang pribumi Jawa di awal abad ke-20, yang berjuang dengan identitasnya di tengah era kolonialisme Belanda.',
      price: 150000,
      synopsis: 'Bumi Manusia menceritakan kisah Minke, seorang pemuda pribumi yang berpendidikan di masa kolonial Belanda, yang mulai menyadari ketidakadilan sosial di sekitarnya. Melalui hubungan cintanya dengan Annelies dan interaksi dengan keluarga Nyai Ontosoroh, Minke belajar tentang harga diri, kesetaraan, dan keberanian untuk berpikir bebas. Novel ini tidak hanya menyoroti kisah cinta, tetapi juga perjuangan bangsa Indonesia melawan penjajahan dan kebodohan. Dengan bahasa yang kuat dan narasi yang menyentuh, Pramoedya Ananta Toer menghadirkan kisah epik tentang kebangkitan kesadaran nasional dan kemanusiaan.',
  ),

  // Kategori: Ekonomi
  Book(
      id: 6,
      title: 'Rich Dad Poor Dad',
      author: 'Robert T. Kiyosaki',
      category: 'Ekonomi',
      imageUrl: 'https://cdn.gramedia.com/uploads/items/9786020333175_rich-dad-poor-dad-_edisi-revisi_.jpg',
      description: 'Buku ini mengajarkan tentang kecerdasan finansial (financial literacy) melalui perbandingan dua figur ayah dengan perspektif berbeda mengenai uang dan investasi.',
      price: 95000,
      synopsis: 'Rich Dad Poor Dad membandingkan dua cara pandang terhadap uang — satu dari ayah kandung yang bekerja keras untuk gaji tetap, dan satu lagi dari ayah sahabatnya yang berpikir seperti pengusaha. Robert T. Kiyosaki menunjukkan bahwa sistem pendidikan formal sering kali gagal mengajarkan cara mengelola uang secara cerdas. Buku ini menekankan pentingnya memiliki aset produktif, memahami arus kas, serta berani mengambil risiko demi mencapai kebebasan finansial. Melalui pengalaman pribadi dan prinsip sederhana, Kiyosaki mengubah cara pandang banyak orang terhadap uang, pekerjaan, dan kesuksesan finansial.',
  ),
];

