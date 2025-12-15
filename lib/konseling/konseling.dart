import 'package:flutter/material.dart';
import '../constants.dart'; // Pastikan file ini ada

// --- HALAMAN UTAMA KONSELING (TAB BAR) ---
class CounselorMainPage extends StatelessWidget {
  const CounselorMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 Tab: Daftar Psikolog & Chat
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text("Layanan Konseling", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: kPrimaryColor,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: "Daftar Konselor"),
              Tab(text: "Chat"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PsychologistListTab(), // Tab Kiri (List Pesan)
            _ChatHistoryTab(),      // Tab Kanan (History Chat)
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// 1. TAB DAFTAR PSIKOLOG / KONSELOR
// ==========================================================
class _PsychologistListTab extends StatelessWidget {
  const _PsychologistListTab();

  @override
  Widget build(BuildContext context) {
    // DATA DUMMY
    List<Map<String, dynamic>> counselors = [
      {
        "name": "Budi Santoso, S.Psi, M.Psi",
        "role": "Psikolog Klinis (S2)",
        "tags": ["Trauma", "Depression", "Specialized"],
        "status": true,
        "isBooked": true, // Sudah pesan (Hijau)
        "tier": 3,
      },
      {
        "name": "Rara Sekar",
        "role": "Mahasiswa Tingkat Akhir",
        "tags": ["Peer Support", "Curhat", "Venting"],
        "status": true,
        "isBooked": false,
        "tier": 1,
      },
      {
        "name": "Andi Pratama, S.Psi",
        "role": "Konselor Junior (S1)",
        "tags": ["Anxiety", "Stress", "Konseling Serius"],
        "status": false,
        "isBooked": false,
        "tier": 2,
      },
      {
        "name": "Dr. Sarah Wijaya, S.Psi, M.Psi",
        "role": "Psikolog Pendidikan (S2)",
        "tags": ["Trauma", "Depression", "Specialized"],
        "status": true,
        "isBooked": false,
        "tier": 3,
      },
      {
        "name": "Daffa Ahmad",
        "role": "Mahasiswa Psikologi Smst 7",
        "tags": ["Peer Support", "Curhat", "Venting"],
        "status": true,
        "isBooked": false,
        "tier": 1,
      },
      {
        "name": "Citra Kirana, S.Psi",
        "role": "Konselor Remaja (S1)",
        "tags": ["Anxiety", "Stress", "Konseling Serius"],
        "status": true,
        "isBooked": false,
        "tier": 2,
      },
      {
        "name": "Bayu Skak, S.Psi, M.Psi",
        "role": "Psikolog Keluarga (S2)",
        "tags": ["Trauma", "Depression", "Specialized"],
        "status": false,
        "isBooked": true, // Sudah pesan (Hijau)
        "tier": 3,
      },
      {
        "name": "Fani Rose",
        "role": "Mahasiswa Tingkat Akhir",
        "tags": ["Peer Support", "Curhat", "Venting"],
        "status": true,
        "isBooked": false,
        "tier": 1,
      },
      {
        "name": "Eko Patrio, S.Psi",
        "role": "Konselor Karir (S1)",
        "tags": ["Anxiety", "Stress", "Konseling Serius"],
        "status": true,
        "isBooked": false,
        "tier": 2,
      },
      {
        "name": "Gilang Dirga, S.Psi, M.Psi",
        "role": "Psikolog Industri (S2)",
        "tags": ["Trauma", "Depression", "Specialized"],
        "status": false,
        "isBooked": false,
        "tier": 3,
      },
    ];

    // LOGIKA SORTING
    counselors.sort((a, b) {
      if (a['isBooked'] == b['isBooked']) return 0;
      return a['isBooked'] ? 1 : -1;
    });

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: counselors.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final data = counselors[index];
        final bool isBooked = data['isBooked'];
        final Color statusColor = isBooked ? Colors.green : Colors.orange;

        return InkWell(
          onTap: () {
            if (isBooked) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(name: data['name'])));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleBookingPage(counselorData: data)));
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: isBooked ? Border.all(color: Colors.green.withOpacity(0.5), width: 1.5) : null,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: kPrimaryColor.withOpacity(0.1),
                      child: Text((data['name'])[0], style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(data['role'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 4, runSpacing: 4,
                            children: (data['tags'] as List).map((t) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
                              child: Text("#$t", style: const TextStyle(fontSize: 10, color: Colors.indigo)),
                            )).toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: statusColor,
                      disabledBackgroundColor: statusColor,
                      disabledForegroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      isBooked ? "Chat" : "Pesan",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ==========================================================
// 2. TAB RIWAYAT CHAT
// ==========================================================
class _ChatHistoryTab extends StatelessWidget {
  const _ChatHistoryTab();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> activeChats = [
      {"name": "Budi Santoso, S.Psi, M.Psi", "lastMessage": "Halo, sesi konsultasi kita dimulai pukul 10:00 ya.", "time": "Baru saja", "hasNewMessage": true},
      {"name": "Bayu Skak, S.Psi, M.Psi", "lastMessage": "Terima kasih, nanti kabari jika ada kendala.", "time": "Kemarin", "hasNewMessage": false},
    ];

    if (activeChats.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 60, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text("Belum ada chat aktif", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: activeChats.length,
      itemBuilder: (context, index) {
        final chat = activeChats[index];
        return _buildChatTile(context, chat);
      },
    );
  }

  Widget _buildChatTile(BuildContext context, Map<String, dynamic> chat) {
    final bool hasNewMessage = chat['hasNewMessage'] as bool;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(name: chat['name'])));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.indigo.withOpacity(0.1),
                  child: const Icon(Icons.person_rounded, color: Colors.indigo),
                ),
                if (hasNewMessage)
                  Positioned(
                    right: 0, bottom: 0,
                    child: Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(color: Colors.indigo, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                    ),
                  )
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                  const SizedBox(height: 4),
                  Text(
                    chat['lastMessage'],
                    style: TextStyle(color: hasNewMessage ? Colors.black : Colors.grey[700], fontSize: 13, fontWeight: hasNewMessage ? FontWeight.bold : FontWeight.normal),
                    overflow: TextOverflow.ellipsis, maxLines: 1,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(chat['time'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// 3. HALAMAN RUANG CHAT (DIPAKAI BERSAMA)
// ==========================================================
class ChatRoomPage extends StatelessWidget {
  final String name;
  const ChatRoomPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        // PERBAIKAN: Hapus 'const' pada Icon agar bisa pakai kPrimaryColor
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Voice Call dimulai...")));
            },
            icon: Icon(Icons.call, color: kPrimaryColor), // HAPUS const DI SINI
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Video Call dimulai...")));
            },
            icon: Icon(Icons.videocam, color: kPrimaryColor), // HAPUS const DI SINI
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Mulai percakapan konsultasi dengan $name", style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center))),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: "Ketik pesan...", filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 20)))),
                const SizedBox(width: 8),
                CircleAvatar(backgroundColor: kPrimaryColor, child: const Icon(Icons.send, color: Colors.white, size: 20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ==========================================================
// 4. HALAMAN PESAN JADWAL (DETAIL & HARGA)
// ==========================================================
class ScheduleBookingPage extends StatelessWidget {
  final Map<String, dynamic> counselorData;
  const ScheduleBookingPage({super.key, required this.counselorData});

  @override
  Widget build(BuildContext context) {
    final int tier = counselorData['tier'] ?? 1;
    String title = "";
    String content = "";

    if (tier == 1) {
      title = "TIER 1: UNDERGRADUATE\n(Mahasiswa S1 Psikologi) - PALING TERJANGKAU";
      content = "💬 Text Chat (30 menit): Rp 20.000 \n\n🎙️ Voice Call (45 menit): Rp 25.000\n\n📹 Video Call (45 menit): Rp 35.000\n\nFee konselor: 65-70% | Perfect untuk: peer support, curhat, venting";
    } else if (tier == 2) {
      title = "TIER 2: FRESH GRADUATE\n(S2/SIPP Baru) - PROFESIONAL TERJANGKAU";
      content = "💬 Text Chat (45 menit): Rp 35.000\n\n🎙️ Voice Call (60 menit): Rp 45.000\n\n📹 Video Call (60 menit): Rp 60.000\n\nFee psikolog: 70-75% | Perfect untuk: anxiety, stress, konseling serius";
    } else {
      title = "TIER 3: PROFESSIONAL\n(Pengalaman >2 tahun) - ADVANCED THERAPY";
      content = "💬 Text Chat (45 menit): Rp 50.000\n\n🎙️ Voice Call (60 menit): Rp 65.000\n\n📹 Video Call (60 menit): Rp 85.000\n\nFee psikolog: 75-80% | Perfect untuk: trauma, depression, specialized";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Detail Layanan"), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 30, backgroundColor: kPrimaryColor.withOpacity(0.1), child: Text((counselorData['name'])[0], style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20))),
                const SizedBox(width: 16),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(counselorData['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text(counselorData['role'], style: const TextStyle(color: Colors.grey))])),
              ],
            ),
            const SizedBox(height: 24), const Divider(), const SizedBox(height: 24),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrimaryColor)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFFF5F9FA), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
              child: Text(content, style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87)),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPaymentPage(counselorName: counselorData['name'])));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text("Pilih Jadwal & Bayar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// 5. HALAMAN BARU: PILIH JADWAL & BAYAR (QRIS ONLY)
// ==========================================================
class BookingPaymentPage extends StatefulWidget {
  final String counselorName;
  const BookingPaymentPage({super.key, required this.counselorName});

  @override
  State<BookingPaymentPage> createState() => _BookingPaymentPageState();
}

class _BookingPaymentPageState extends State<BookingPaymentPage> {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String? _selectedTime;
  final List<String> _timeSlots = ["09:00", "10:00", "13:00", "15:00", "16:00", "19:00", "20:00"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Atur Jadwal & Bayar"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("1. Pilih Tanggal Konsultasi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (picked != null) {
                  setState(() => _selectedDate = picked);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 12),
                    Text("${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            const Text("2. Pilih Jam", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10, runSpacing: 10,
              children: _timeSlots.map((time) {
                final isSelected = _selectedTime == time;
                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  selectedColor: kPrimaryColor,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                  onSelected: (selected) {
                    setState(() => _selectedTime = selected ? time : null);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            
            const Text("3. Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 1.5), borderRadius: BorderRadius.circular(12), color: kPrimaryColor.withOpacity(0.05)),
              child: RadioListTile(
                value: 1,
                groupValue: 1,
                onChanged: (val) {},
                activeColor: kPrimaryColor,
                title: const Text("QRIS (Scan Barcode)", style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.qr_code_scanner, color: Colors.black),
              ),
            ),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedTime != null 
                  ? () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pembayaran Berhasil! Jadwal telah diatur."), backgroundColor: Colors.green));
                    } 
                  : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Bayar Sekarang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}