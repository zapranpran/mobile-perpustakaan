import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perpustakaan/app/data/profile_response.dart';
import 'package:perpustakaan/app/utils/api.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');
  final isLoading = false.obs;
  
  // Variabel untuk menyimpan profil
  var profile = Profiles().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      isLoading(true);
      final response = await _getConnect.get(
        BaseUrl.profile,
        headers: {'Authorization': "Bearer $token"},
      );

      // if (response.statusCode == 200) {
      //   var profileResponse = ProfileResponse.fromJson(response.body);
      //   profiles.value = profileResponse.profiles ?? Profiles();
      // } else {
      //   print("Failed to load profile: ${response.statusText}");
      // }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void logout() {
    box.remove('token');
    Get.offAllNamed('/login');
  }
}


