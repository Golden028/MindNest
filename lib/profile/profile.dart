import 'package:flutter/material.dart';
import '../constants.dart'; // Import kPrimaryColor
import '../login.dart'; // <--- PASTIKAN Anda mengimpor halaman Login di sini

// ==========================================================
// 1. HALAMAN UTAMA PROFIL
// ==========================================================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Fungsi navigasi Logout
  void _handleLogout(BuildContext context) {
    // Navigasi ke LoginPage dan HAPUS SEMUA RUTE sebelumnya dari stack.
    // Ini mencegah user menekan tombol 'back' kembali ke Dashboard.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false, // Hapus semua rute
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Profil Saya", style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // 1. Bagian Atas: Profile Card (Bentuk tetap sama, tapi lebih kecil)
          _buildProfileCard(context),
          
          // 2. Pengaturan Akun (Lebih Kecil)
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Pengaturan Akun", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12))
            ),
          ),
          _buildOptionTile(
            title: "Ubah Profil", 
            icon: Icons.person_rounded, 
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage())),
          ),
          _buildOptionTile(
            title: "Ubah Kata Sandi", 
            icon: Icons.lock_rounded, 
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordPage())),
          ),

          // 3. Bagian Tengah: Self Assessment (Tetap Kecil/Ramping sesuai permintaan sebelumnya)
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Self Assessment", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12))
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildTestCard(context, "Stress Akademik", "Kewalahan tugas?", Icons.school_rounded, Colors.orange),
                _buildTestCard(context, "Kecemasan", "Cek tingkat cemas.", Icons.sentiment_dissatisfied_rounded, Colors.blue),
                _buildTestCard(context, "Burnout Scale", "Lelah mental?", Icons.battery_alert_rounded, Colors.redAccent),
                _buildTestCard(context, "Kualitas Tidur", "Tidur nyenyak?", Icons.bedtime_rounded, Colors.indigo),
              ],
            ),
          ),

          // 4. Bagian Bawah: Logout
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 45, // Tinggi tombol agak kecil
              child: ElevatedButton.icon(
                // LOGIKA INI SUDAH DIPERBAIKI:
                onPressed: () => _handleLogout(context),
                icon: const Icon(Icons.logout_rounded, color: Colors.red, size: 20),
                label: const Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper untuk Profile Card (AGAK KECIL TAPI TIDAK UBAH BENTUK)
  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding dikurangi
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column( // Tetap Column (Vertikal)
        children: [
          CircleAvatar(
            radius: 35, // Radius diperkecil dari 40 ke 35
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.person, size: 35, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            "Golden Christian", 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font size diperkecil sedikit
          ),
          const SizedBox(height: 2),
          Text(
            "golden@gmail.com", 
            style: TextStyle(color: Colors.grey[600], fontSize: 13), // Font size diperkecil
          ),
        ],
      ),
    );
  }

  // Helper untuk Option Tile (AGAK KECIL)
  Widget _buildOptionTile({required String title, required IconData icon, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2), // Membuat list tile lebih padat
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: Icon(icon, color: kPrimaryColor, size: 22),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // Helper untuk Test Card (TETAP KECIL - Versi Terbaru)
  Widget _buildTestCard(BuildContext context, String title, String subtitle, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(title: title)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// 2. HALAMAN UBAH PROFIL (AGAK KECIL)
// ==========================================================
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: "Golden Christian");
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Ubah Profil", style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white, elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40, // Diperkecil
                  backgroundColor: kPrimaryColor.withOpacity(0.2),
                  child: Icon(Icons.person, size: 40, color: kPrimaryColor),
                ),
                Positioned(
                  bottom: 0, right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                labelStyle: const TextStyle(fontSize: 13),
                prefixIcon: const Icon(Icons.person_outline, size: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                isDense: true, // Membuat field lebih pendek
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  labelStyle: const TextStyle(fontSize: 13),
                  prefixIcon: const Icon(Icons.calendar_today, size: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                child: Text(
                  _selectedDate == null
                      ? "Pilih Tanggal"
                      : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                  style: TextStyle(color: _selectedDate == null ? Colors.grey : Colors.black, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profil Berhasil Diperbarui')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Simpan Perubahan", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// 3. HALAMAN UBAH KATA SANDI (AGAK KECIL)
// ==========================================================
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Ubah Kata Sandi", style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildPasswordField("Password Sekarang", _obscureCurrent, () => setState(() => _obscureCurrent = !_obscureCurrent)),
            const SizedBox(height: 16),
            _buildPasswordField("Password Baru", _obscureNew, () => setState(() => _obscureNew = !_obscureNew)),
            const SizedBox(height: 16),
            _buildPasswordField("Tulis Ulang Password Baru", _obscureConfirm, () => setState(() => _obscureConfirm = !_obscureConfirm)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kata Sandi Berhasil Diubah')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Simpan Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, bool obscure, VoidCallback onToggle) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 13),
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, size: 20),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
    );
  }
}

// ==========================================================
// 4. HALAMAN KUIS / SOAL
// ==========================================================
class QuizPage extends StatelessWidget {
  final String title;
  const QuizPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 16)), 
        backgroundColor: Colors.white, 
        foregroundColor: Colors.black, 
        elevation: 0
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: 0.1, backgroundColor: Colors.grey[200], color: kPrimaryColor),
            const SizedBox(height: 16),
            Text("Pertanyaan 1 dari 10", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(height: 12),
            const Text("Dalam seminggu terakhir, seberapa sering kamu merasa sulit untuk rileks?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _optionBtn("Tidak Pernah"),
            _optionBtn("Kadang-kadang"),
            _optionBtn("Sering"),
            _optionBtn("Hampir Selalu"),
          ],
        ),
      ),
    );
  }

  Widget _optionBtn(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        child: Text(text, style: const TextStyle(color: Colors.black87, fontSize: 14)),
      ),
    );
  }
}