import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.defaultDialog(
                title: "Konfirmasi",
                middleText: "Apakah kamu yakin ingin logout?",
                textCancel: "Batal",
                textConfirm: "Logout",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back(); // tutup dialog dulu
                  controller.logout();
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = controller.profile.value;

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Header background dengan gradasi
                  ClipPath(
                    clipper: ProfileClipper(),
                    child: Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF5C6BC0), Color(0xFF7986CB)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // Foto profil
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  const AssetImage('assets/profile.jpg'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            profile.name ?? "-",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),

              // Card info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    buildInfoCard(
                        "Email", profile.email ?? "-", Icons.email_outlined),
                    buildInfoCard("Alamat", profile.address ?? "-",
                        Icons.location_on_outlined),
                    buildInfoCard(
                        "Nomor HP", profile.noHp ?? "-", Icons.phone_outlined),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildInfoCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: Icon(icon, color: Colors.indigo),
      ),
    );
  }
}

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
