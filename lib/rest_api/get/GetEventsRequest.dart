import 'package:connect/rest_api/ApiClient.dart';
import 'package:get/get.dart';

class GetEventsRequest extends GetxService {

  final ApiClient apiClient;

  GetEventsRequest({ required this.apiClient });

  Future<Response> getEventsList() async {
    return await apiClient.getDate("uri here");
  }
}