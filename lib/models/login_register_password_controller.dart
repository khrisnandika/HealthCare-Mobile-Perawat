import 'package:get/get.dart';

class passwordController extends GetxController {
  var showPassword = true.obs;
  var showConfirmPassword = true.obs;

  void showPass() => showPassword.value = !showPassword.value;
  void showConfirmPass() => showConfirmPassword.value = !showConfirmPassword.value;
}
