  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:lottie/lottie.dart';
  import 'package:perpustakaan/app/data/buku_response.dart';
  import 'package:perpustakaan/app/modules/dashboard/controllers/dashboard_controller.dart';
  import 'package:perpustakaan/app/modules/dashboard/views/buku_detail_view.dart';
  import 'package:zoom_tap_animation/zoom_tap_animation.dart';

  class IndexView extends GetView<DashboardController> {
    const IndexView({super.key});

    @override
    Widget build(BuildContext context) {
      DashboardController controller = Get.put(DashboardController());

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<BukuResponse>(
            future: controller.getEvent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.network(
                   'assets/animations/buku.json',
                    repeat: true,
                    width: MediaQuery.of(context).size.width / 1,
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
              }

              if (!snapshot.hasData || snapshot.data!.bukus!.isEmpty) {
                return const Center(child: Text("Tidak ada data buku."));
              }

              final bukus = snapshot.data!.bukus!;

              return GridView.builder(
                itemCount: bukus.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final buku = bukus[index];
                  return eventList(buku);
                },
              );
            },
          ),
        ),
      );
    }

    Widget eventList(Bukus buku) {
      return ZoomTapAnimation(
        onTap: () {
          Get.to(() => BukuDetailView(), arguments: buku);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
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
              // Gambar Buku
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  buku.foto != null && buku.foto!.isNotEmpty
                      ? buku.foto!
                      : 'https://via.placeholder.com/600x300?text=No+Image',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      color: Colors.grey,
                      child: const Center(
                        child: Text("Gambar tidak ditemukan"),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul Buku
                    Text(
                      buku.judul ?? 'Judul tidak tersedia',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Nama Penulis
                    Text(
                      buku.penulis?.namaPenulis ?? 'Penulis tidak diketahui',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Penerbit
                    Text(
                      buku.penerbit?.namaPenerbit ?? 'Penerbit tidak diketahui',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Kategori
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.blueAccent,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            buku.kategori?.namaKategori ?? 'Kategori tidak tersedia',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Tahun Terbit
                    Text(
                      'Tahun Terbit: ${buku.tahunTerbit ?? 'Tidak diketahui'}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),

                    // Jumlah Buku
                    Text(
                      '${buku.jumlah ?? 0} Buku tersedia',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
