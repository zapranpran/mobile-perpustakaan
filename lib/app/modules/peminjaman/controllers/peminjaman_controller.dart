import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:perpustakaan/app/data/peminjaman_response.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class PeminjamanController extends GetxController {
  var isLoading = true.obs;
  var peminjamans = <Peminjamans>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPeminjaman();
  }

  void fetchPeminjaman() async {
    try {
      isLoading(true);

      final token = GetStorage().read('access_token');
      print('TOKEN: $token');
      final response = await http.get(
        Uri.parse(
            'http://192.168.43.93:8000/api/peminjaman'), // Ganti 127.0.0.1 ya!
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success'] == true) {
          peminjamans.value = List<Peminjamans>.from(
            data['peminjamans'].map((x) => Peminjamans.fromJson(x)),
          );
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching peminjaman: $e");
    } finally {
      isLoading(false);
    }
  }
}
