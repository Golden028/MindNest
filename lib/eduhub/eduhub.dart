import 'package:flutter/material.dart';
import '../constants.dart';

class EduHubPage extends StatelessWidget {
  const EduHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    // DATA DUMMY (KONTEN ASLI)
    final List<Map<String, dynamic>> articles = [
      {
        "title": "5 Langkah Teknik Pomodoro",
        "category": "Produktivitas",
        "color": Colors.orange,
        "content": '''
Teknik Pomodoro adalah metode manajemen waktu yang dikembangkan oleh Francesco Cirillo pada akhir 1980-an. Teknik ini menggunakan pengatur waktu untuk memecah kerja menjadi interval, biasanya berdurasi 25 menit, yang dipisahkan oleh istirahat singkat.

Berikut adalah 5 langkah dasarnya:

1. Tentukan tugas yang akan dikerjakan.
Pilih satu tugas spesifik, jangan multitasking.

2. Atur timer selama 25 menit.
Berjanjilah pada diri sendiri: "Saya akan menghabiskan 25 menit untuk tugas ini dan tidak akan membiarkan gangguan."

3. Kerjakan tugas hingga timer berbunyi.
Tenggelamkan diri dalam tugas tersebut. Jika teringat sesuatu yang lain, catat saja di kertas dan segera kembali bekerja.

4. Istirahat singkat (5 menit).
Tarik napas, meditasi, ambil minum, atau jalan-jalan sebentar. Ini memberi otak kesempatan untuk beristirahat.

5. Setiap 4 Pomodoro, ambil istirahat lebih lama.
Setelah empat siklus kerja, ambil istirahat panjang sekitar 20-30 menit. Otak Anda akan menggunakan waktu ini untuk mengasimilasi informasi baru dan beristirahat sebelum putaran berikutnya.
'''
      },
      {
        "title": "Tips Mengatasi Insomnia",
        "category": "Kesehatan",
        "color": Colors.blue,
        "content": '''
Sulit tidur atau insomnia sering dialami oleh mahasiswa karena stres tugas atau pola hidup yang tidak teratur. Berikut adalah cara efektif untuk memperbaikinya:

1. Tetapkan Jadwal Tidur Konsisten
Cobalah tidur dan bangun pada waktu yang sama setiap hari, bahkan di akhir pekan. Ini membantu mengatur jam internal tubuh Anda.

2. Batasi Paparan Cahaya Biru (Blue Light)
Hindari layar HP, laptop, atau TV setidaknya 1 jam sebelum tidur. Cahaya biru menekan produksi melatonin, hormon yang membuat Anda mengantuk.

3. Perhatikan Asupan Kafein
Hindari kopi, teh, atau minuman berenergi setelah jam 2 siang. Efek kafein bisa bertahan hingga 8 jam di dalam tubuh.

4. Ciptakan Lingkungan Tidur yang Nyaman
Pastikan kamar tidur Anda gelap, sejuk, dan tenang. Gunakan masker mata atau penyumbat telinga jika perlu.

5. Teknik Relaksasi
Lakukan pernapasan dalam atau relaksasi otot progresif sebelum tidur untuk menenangkan pikiran yang "berisik".
'''
      },
      {
        "title": "Panduan Meditasi Pemula",
        "category": "Mindfulness",
        "color": Colors.purple,
        "content": '''
Meditasi bukan berarti mengosongkan pikiran sepenuhnya, melainkan melatih fokus dan kesadaran (mindfulness). Berikut cara mudah memulainya:

1. Cari Posisi Nyaman
Duduklah di kursi atau bersila di lantai. Pastikan punggung tegak namun tidak kaku. Letakkan tangan di paha atau lutut.

2. Atur Waktu Singkat
Untuk pemula, cukup mulai dengan 3 hingga 5 menit saja. Jangan memaksakan durasi panjang.

3. Fokus pada Pernapasan
Tutup mata Anda. Perhatikan sensasi udara yang masuk dan keluar melalui hidung. Rasakan naik turunnya dada atau perut Anda.

4. Sadari Pikiran yang Mengembara
Sangat wajar jika pikiran Anda melayang ke tugas kuliah atau menu makan malam. Jangan menghakimi diri sendiri. Cukup sadari bahwa pikiran Anda melayang, lalu dengan lembut bawa kembali fokus ke napas.

5. Akhiri dengan Perlahan
Ketika waktu habis, buka mata perlahan. Rasakan tubuh Anda dan lingkungan sekitar sebelum kembali beraktivitas.
'''
      },
      {
        "title": "Tips Kelola Uang Kost",
        "category": "Life Skill",
        "color": Colors.green,
        "content": '''
Mengelola keuangan sebagai anak kost adalah tantangan tersendiri. Agar tidak "boncos" di akhir bulan, coba terapkan tips berikut:

1. Catat Arus Kas (Cashflow)
Gunakan aplikasi pencatat keuangan atau buku kecil. Catat setiap pengeluaran sekecil apapun (termasuk parkir atau jajan). Ini membantu Anda sadar ke mana uang pergi.

2. Terapkan Rumus 50/30/20
- 50% untuk Kebutuhan (Makan, Transport, Listrik).
- 30% untuk Keinginan (Nonton, Jajan Kopi, Hobi).
- 20% untuk Tabungan/Dana Darurat.

3. Masak Sendiri vs Beli Makan
Membeli makan setiap hari sangat boros. Cobalah masak nasi sendiri dan beli lauk matang, atau masak menu sederhana seperti telur dan sayur sop.

4. Hindari "Latte Factor"
Pengeluaran kecil yang sering, seperti kopi kekinian Rp25.000 setiap hari, jika ditotal sebulan bisa mencapai Rp750.000. Kurangi frekuensinya.

5. Manfaatkan Diskon Mahasiswa
Jangan malu menggunakan status mahasiswa untuk mendapatkan harga promo, baik untuk software, makanan, atau transportasi.
'''
      },
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Edu-Hub", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final item = articles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {
                // NAVIGASI KE HALAMAN DETAIL
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailPage(data: item)));
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: (item['color'] as Color).withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.menu_book_rounded, color: item['color'] as Color, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 6),
                          Text(item['category'], style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- HALAMAN DETAIL ARTIKEL (KONTEN LENGKAP) ---
class ArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ArticleDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: (data['color'] as Color).withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.menu_book_rounded, size: 80, color: data['color']),
            ),
            const SizedBox(height: 24),
            Text(data['category'].toString().toUpperCase(), style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const SizedBox(height: 8),
            Text(data['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            // Menampilkan konten artikel yang sebenarnya
            Text(
              data['content'],
              style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            // "Lorem ipsum" dihapus agar lebih bersih
          ],
        ),
      ),
    );
  }
}