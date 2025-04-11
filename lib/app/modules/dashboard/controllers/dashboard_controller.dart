import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perpustakaan/app/data/buku_response.dart';
import 'package:perpustakaan/app/modules/dashboard/views/index_view.dart';
import 'package:perpustakaan/app/modules/dashboard/views/peminjaman_view.dart';
import 'package:perpustakaan/app/modules/dashboard/views/profile_view.dart';
// import 'package:perpustakaan/app/modules/dashboard/views/profile_view.dart';
import 'package:perpustakaan/app/utils/api.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  late GetConnect _getConnect;
  late String? token;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    PeminjamanView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();

    _getConnect = GetConnect();
    _getConnect.timeout = const Duration(seconds: 10);

    final box = GetStorage();
    token = box.read('auth_token');
    print('📦 TOKEN DARI STORAGE: $token');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<BukuResponse> getEvent() async {
    final box = GetStorage();
    token = box.read('auth_token');
    
    if (token == null || token!.isEmpty) {
      throw Exception('Token tidak ditemukan. Harap login ulang.');
    }

    try {
      final response = await _getConnect.get(
        BaseUrl.buku,
        headers: {
          'Authorization': "Bearer $token",
          'Accept': 'application/json',
        },
        contentType: "application/json",
      );

      if (response.statusCode == 200) {
        if (response.body == null || response.body is! Map<String, dynamic>) {
          throw Exception('Format data tidak sesuai: ${response.body}');
        }
        return BukuResponse.fromJson(response.body);
      } else {
        throw Exception(
            'Gagal mengambil data. Status: ${response.statusCode} - ${response.statusText}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi logout user
  void logOut() async {
    final response = await _getConnect.post(
      BaseUrl.logout,
      {},
      headers: {'Authorization': "Bearer $token"},
      contentType: "application/json",
    );

    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'Logout berhasil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      GetStorage().erase();

      Get.offAllNamed('/login');
    } else {
      Get.snackbar(
        'Failed',
        'Logout gagal',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
