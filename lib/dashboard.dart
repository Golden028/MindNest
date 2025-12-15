import 'package:flutter/material.dart';
import 'constants.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header & Notifikasi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAMA PENGGUNA DIUPDATE DI SINI
                      const Text(
                        "Halo, Golden Christian! 👋",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Semoga harimu menyenangkan.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade200)),
                    child: const Icon(Icons.notifications_none_rounded, color: Colors.black54),
                  )
                ],
              ),
              const SizedBox(height: 24),

              // 2. Mood Tracker
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Bagaimana perasaanmu?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 16),
                    _buildMoodSelector(),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Quote of the Day
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("💡 Quote Hari Ini", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                      '"Istirahatlah jika lelah. Produktivitas bukan berarti harus bekerja 24/7."',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 4. Jadwal/Aktivitas
              const Text("Jadwal Mendatang", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.calendar_today_rounded, color: Colors.orange),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sesi Konseling Online", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Besok, 10:00 WIB • Dr. Sarah", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 5. Card Statistik
              _buildProgressCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodSelector() {
    final moods = [
      {'emoji': '😄', 'label': 'Senang'},
      {'emoji': '🙂', 'label': 'Biasa'},
      {'emoji': '😰', 'label': 'Cemas'},
      {'emoji': '😢', 'label': 'Sedih'},
      {'emoji': '😡', 'label': 'Marah'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: moods.map((mood) {
        return Column(
          children: [
            Text(mood['emoji']!, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 4),
            Text(mood['label']!, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo[50], // Ganti warna background grafik ke nuansa biru
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.indigo.shade100), // Border Biru
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Ganti Colors.teal -> Colors.indigo
              const Text("Grafik Mood", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo)),
              Icon(Icons.show_chart_rounded, color: Colors.indigo.shade700),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              // Ganti Colors.teal -> Colors.indigo
              children: List.generate(7, (index) => Container(width: 8, height: 20.0 + (index * 5), decoration: BoxDecoration(color: Colors.indigo.shade300, borderRadius: BorderRadius.circular(4)))),
            ),
          ),
          const SizedBox(height: 15),
          const Text("Mood kamu stabil minggu ini. Pertahankan!", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.indigo)),
        ],
      ),
    );
  }
}