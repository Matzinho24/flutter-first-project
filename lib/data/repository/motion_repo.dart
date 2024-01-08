import 'package:connect/data/api/api_client.dart';
import 'package:connect/utils/app_constants.dart';
import 'package:get/get.dart';

class MotionRepo extends GetxService {

  final ApiClient apiClient;

  MotionRepo({required this.apiClient});

  Future<Response> getMotionList() async {
    return await apiClient.getData(AppConstants.MOTION_URL);
  }
}