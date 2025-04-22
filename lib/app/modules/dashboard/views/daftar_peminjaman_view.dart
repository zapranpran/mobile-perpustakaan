import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/modules/peminjaman/controllers/peminjaman_controller.dart';

class DaftarPeminjamanView extends StatelessWidget {
  final controller = Get.put(PeminjamanController());

  DaftarPeminjamanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.peminjamans.isEmpty) {
          return const Center(child: Text("Belum ada data peminjaman."));
        }

        return ListView.builder(
          itemCount: controller.peminjamans.length,
          itemBuilder: (context, index) {
            final peminjaman = controller.peminjamans[index];
            final buku = peminjaman.buku;
            final user = peminjaman.user;

            return Card(
              margin: const EdgeInsets.all(12),
              elevation: 3,
              child: ListTile(
                leading: buku?.foto != null
                    ? Image.network(
                        'http://127.0.0.1:8000/images/buku/${buku!.foto}',
                        width: 60,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.book),
                title: Text(buku?.judul ?? 'Judul tidak tersedia'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dipinjam oleh: ${user?.name ?? 'User tidak diketahui'}'),
                    Text('Jumlah: ${peminjaman.jumlah}'),
                    Text('Tgl Pinjam: ${peminjaman.tanggalPinjam}'),
                    Text('Batas: ${peminjaman.batasPinjam}'),
                    Text('Status: ${peminjaman.status}'),
                  ],
                ),
                isThreeLine: true,
              ),
            );
          },
        );
      }),
    );
  }
}
