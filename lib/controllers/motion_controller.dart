import 'package:connect/business_objects/motion_model.dart';
import 'package:connect/data/repository/motion_repo.dart';
import 'package:get/get.dart';

class MotionController extends GetxController {

  final MotionRepo motionRepo;

  MotionController({ required this.motionRepo});

  List<dynamic> _motionList = [];
  List<dynamic> get motionList => _motionList;

  Future<void> getMotionList() async {
    Response response = await motionRepo.getMotionList();
    print("response code:"  +response.statusCode.toString());
    print("response code:"  +response.body.toString());
    if(response.statusCode == 200){
      _motionList = [];
      _motionList.addAll(Motion.fromJson(response.body).motions);
      update();
    } else {

    }
  }
}