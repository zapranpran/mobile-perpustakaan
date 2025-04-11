import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perpustakaan/app/modules/dashboard/views/dashboard_view.dart';
import 'package:perpustakaan/app/utils/api.dart';

class LoginController extends GetxController {
  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  void loginNow() async {
    final response = await _getConnect.post(BaseUrl.login, {
      'email': emailController.text,
      'password': passwordController.text,
    });

    print('🚀 LOGIN RESPONSE: ${response.body}');

    if (response.statusCode == 200) {
      final accessToken = response.body['access_token'];
      print('✅ TOKEN YANG DITERIMA DARI BACKEND: $accessToken');

      // SIMPAN TOKEN
      await authToken.write('auth_token', accessToken);

      // CEK TOKEN UDAH TERSIMPAN BELUM
      final cekToken = authToken.read('auth_token');
      print('📦 TOKEN YANG UDAH DISIMPAN: $cekToken');

      // Navigasi ke DashboardView PASTIKAN BINDING DIPANGGIL
      Get.offAllNamed('/dashboard');
    } else {
      final errorMessage =
          (response.body is Map && response.body['error'] != null)
              ? response.body['error'].toString()
              : 'Login gagal. Coba lagi.';

      Get.snackbar(
        'Error',
        errorMessage,
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
