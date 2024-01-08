import 'package:connect/controllers/motion_controller.dart';
import 'package:connect/data/api/api_client.dart';
import 'package:connect/data/repository/motion_repo.dart';
import 'package:connect/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //respos
  Get.lazyPut(() => MotionRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => MotionController(motionRepo: Get.find()));
}