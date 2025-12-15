import 'package:flutter/material.dart';
import 'constants.dart';

// Import semua halaman fitur
import 'dashboard.dart';
import 'konseling/konseling.dart'; 
import 'forum/forum.dart'; 
import 'eduhub/eduhub.dart';
import 'profile/profile.dart'; // Mengasumsikan ini adalah lokasi file ProfilePage yang baru

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Index 2 adalah halaman Dashboard (Home) agar berada di tengah
  int _selectedIndex = 2;

  // Daftar Halaman sesuai urutan Icon di Bottom Bar
  final List<Widget> _pages = [
    const EduHubPage(),       // 0: EduHub
    const CounselorMainPage(),// 1: Konseling (Riwayat Chat & Pesan Psikolog)
    const DashboardPage(),    // 2: Tengah (HOME)
    const ForumMainPage(),    // 3: Komunitas (Forum & Chat Teman)
    const ProfilePage(),      // 4: Profile (Menggantikan HealthCheckPage)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            // 0. EduHub
            const BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline_rounded),
              activeIcon: Icon(Icons.lightbulb_rounded),
              label: 'EduHub',
            ),
            // 1. Konseling (Kembali menggunakan nama 'Konseling')
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              activeIcon: Icon(Icons.chat_bubble_rounded),
              label: 'Konseling', 
            ),
            // 2. Dashboard (Tengah - Spesial Design)
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2 ? kPrimaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                  boxShadow: _selectedIndex == 2 
                      ? [BoxShadow(color: kPrimaryColor.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))] 
                      : [],
                ),
                child: Icon(
                  Icons.home_rounded,
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                  size: 28,
                ),
              ),
              label: '',
            ),
            // 3. Komunitas
            const BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_rounded),
              activeIcon: Icon(Icons.people_rounded),
              label: 'Komunitas',
            ),
            // 4. Profile (Menggantikan Cek Diri)
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profil', // Label diubah
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          elevation: 0,
        ),
      ),
    );
  }
}
