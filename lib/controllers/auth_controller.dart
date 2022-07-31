import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movies_app/controllers/grener_controller.dart';
import 'package:movies_app/views/wellcome/wellcome.dart';

class AuthController extends GetxController {
  var isLogined = true.obs;

  GenerController controoler = Get.put(GenerController());

  @override
  void onInit() async {
    // TODO: implement onInit
    var token = await GetStorage().read('login_token');
    if (token != null) {
      isLogined.value = true;
    }
    Future.delayed(Duration(seconds: 3), () {
      Get.off(WellcomeScreen());
    });
    super.onInit();
  }
}
