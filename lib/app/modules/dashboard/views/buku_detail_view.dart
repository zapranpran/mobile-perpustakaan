import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/data/buku_response.dart';

class BukuDetailView extends StatelessWidget {
  BukuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Bukus buku = Get.arguments;

    String baseUrl = "https://domain-kamu.com/storage/images/";
    String imageUrl = buku.foto != null && buku.foto!.isNotEmpty
        ? baseUrl + buku.foto!
        : 'https://via.placeholder.com/600x300?text=No+Image';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          buku.judul ?? 'Judul tidak ditemukan',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Buku
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text("Gambar tidak ditemukan"),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Judul Buku
              Text(
                buku.judul ?? 'Judul tidak ditemukan',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Informasi Buku
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailRow('Penulis', buku.penulis?.namaPenulis ?? 'Tidak diketahui'),
                    detailRow('Penerbit', buku.penerbit?.namaPenerbit ?? 'Tidak diketahui'),
                    detailRow('Kategori', buku.kategori?.namaKategori ?? 'Tidak diketahui'),
                    detailRow('Jumlah Buku', '${buku.jumlah ?? 0}'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Sinopsis Buku
              const Text(
                'Sinopsis',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                buku.sinopsis ?? 'Sinopsis tidak tersedia',
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 32),

              // Tombol Aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 140,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali'),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.snackbar(
                          'Pinjam Buku',
                          'Buku "${buku.judul ?? ''}" berhasil dipinjam!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.deepPurple[100],
                          colorText: Colors.black,
                        );
                      },
                      icon: const Icon(Icons.book),
                      label: const Text('Pinjam'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
