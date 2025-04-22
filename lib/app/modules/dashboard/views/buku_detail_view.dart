import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/data/buku_response.dart';

class BukuDetailView extends StatelessWidget {
  BukuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Bukus buku = Get.arguments;

    String imageUrl = buku.foto != null && buku.foto!.isNotEmpty
        ? 'http://127.0.0.1:8000/img/${buku.foto}'
        : 'https://via.placeholder.com/600x300?text=No+Image';

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text(
          buku.judul ?? 'Detail Buku',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: 'buku-${buku.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Informasi Buku
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buku.judul ?? 'Judul tidak tersedia',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    detailInfo(Icons.person, 'Penulis', buku.penulis?.namaPenulis ?? 'Tidak diketahui'),
                    detailInfo(Icons.library_books, 'Kategori', buku.kategori?.namaKategori ?? 'Tidak diketahui'),
                    detailInfo(Icons.business, 'Penerbit', buku.penerbit?.namaPenerbit ?? 'Tidak diketahui'),
                    detailInfo(Icons.calendar_today, 'Tahun Terbit', buku.tahunTerbit ?? 'Tidak diketahui'),
                    detailInfo(Icons.inventory_2, 'Jumlah Buku', '${buku.jumlah ?? 0}'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Sinopsis
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '📖 Sinopsis',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  buku.sinopsis ?? 'Sinopsis tidak tersedia',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                actionButton(Icons.arrow_back, "Kembali", Colors.grey.shade400, () {
                  Get.back();
                }),
                actionButton(Icons.book, "Pinjam", Colors.green, () {
                  Get.snackbar(
                    'Peminjaman Berhasil',
                    'Buku "${buku.judul ?? ''}" berhasil dipinjam!',
                    backgroundColor: Colors.green[100],
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    snackPosition: SnackPosition.TOP,
                    margin: const EdgeInsets.all(12),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailInfo(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.green[600]),
          const SizedBox(width: 10),
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget actionButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
