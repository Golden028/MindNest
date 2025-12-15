import 'package:flutter/material.dart';
import '../constants.dart';
// Import ChatRoomPage dari file konseling karena digunakan juga di sini
import '../konseling/konseling.dart'; 

// Halaman utama untuk Index 3 di Bottom Bar (Komunitas)
class ForumMainPage extends StatelessWidget {
  const ForumMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text("Komunitas", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white, 
          elevation: 0,
          bottom: TabBar(
            labelColor: kPrimaryColor, unselectedLabelColor: Colors.grey, indicatorColor: kPrimaryColor,
            tabs: const [Tab(text: "Forum Anonim"), Tab(text: "Chat Teman")],
          ),
        ),
        body: const TabBarView(
          children: [
            _AnonymousForum(), // Forum Anonim (Postingan)
            _PeerChat(),       // Chat Teman (Random/List)
          ],
        ),
      ),
    );
  }
}

// === TAB 1: FORUM ANONIM ===
class _AnonymousForum extends StatelessWidget {
  const _AnonymousForum();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> posts = [
      {"id": "1", "name": "Anonymous Owl 🦉", "time": "2 jam lalu", "content": "Dosen pembimbing susah banget ditemui...", "tags": "#Skripsi", "replies": "5"},
      {"id": "2", "name": "Anonymous Fox 🦊", "time": "5 jam lalu", "content": "Merasa kesepian banget di rantau...", "tags": "#AnakRantau", "replies": "12"},
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostPage()));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return InkWell(
            onTap: () {
              // NAVIGASI KE CHAT ANONIM/DISKUSI
              Navigator.push(context, MaterialPageRoute(builder: (context) => AnonymousChatRoom(postId: post['id']!, postTitle: post['content']!)));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [Text(post['name']!, style: const TextStyle(fontWeight: FontWeight.bold)), const Spacer(), Text(post['time']!, style: const TextStyle(fontSize: 10, color: Colors.grey))]),
                  const SizedBox(height: 8),
                  Text(post['content']!),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(post['tags']!, style: TextStyle(color: kPrimaryColor, fontStyle: FontStyle.italic)),
                      const Spacer(),
                      const Icon(Icons.comment_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(post['replies']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Halaman Buat Postingan (sama seperti sebelumnya)
class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Buat Postingan", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white, elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Kirim", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
              child: const Row(children: [Icon(Icons.security, size: 16, color: Colors.blue), SizedBox(width: 8), Text("Identitasmu akan disamarkan.", style: TextStyle(fontSize: 12, color: Colors.blue))]),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(hintText: "Judul Topik...", border: InputBorder.none, hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(),
            const Expanded(
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(hintText: "Ceritakan apa yang kamu rasakan...", border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Chat Anonim (Simulasi)
class AnonymousChatRoom extends StatelessWidget {
  final String postId;
  final String postTitle;
  const AnonymousChatRoom({super.key, required this.postId, required this.postTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diskusi: $postTitle"), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 1),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text("Ini adalah ruang chat anonim untuk post #$postId. Ayo mulai diskusi!", style: const TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: "Balas anonim...", filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 20)))),
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

// === TAB 2: CHAT TEMAN CERITA ===
class _PeerChat extends StatelessWidget {
  const _PeerChat();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> peerData = [
      {"name": "Buddy Rara", "role": "Mhs. Psikologi Smst 7", "status": true},
      {"name": "Buddy Daffa", "role": "Mhs. Sastra", "status": false},
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tombol Random Chat
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Mencari teman chat acak...")));
                },
                icon: const Icon(Icons.shuffle_rounded, color: Colors.white),
                label: const Text("Chat Random (Anonim)", style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Sudah Indigo
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12)
                ),
              ),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text("Daftar Teman Cerita", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: peerData.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final data = peerData[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(radius: 25, backgroundColor: kPrimaryColor.withOpacity(0.1), child: Text((data['name'])[6], style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold))),
                          if (data['status'])
                            Positioned(right: 0, bottom: 0, 
                              child: Container(
                                width: 12, height: 12, 
                                decoration: BoxDecoration(
                                  color: Colors.indigo, // Ganti Green -> Indigo
                                  shape: BoxShape.circle, 
                                  border: Border.all(color: Colors.white, width: 2)
                                )
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(data['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(data['role'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ]),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(name: data['name'])));
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 12), minimumSize: const Size(60, 32)),
                        child: const Text("Chat", style: TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}