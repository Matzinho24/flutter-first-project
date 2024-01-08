
class Motion {
  late List<MotionModel> _motions;
  List<MotionModel> get motions => _motions;

  Motion({required motions}){
    _motions = motions;
  }

  Motion.fromJson(Map<String, dynamic> json) {
    if (json['motions'] != null) {
      _motions = <MotionModel>[];
      json['motions'].forEach((v) {
        _motions.add(MotionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['motions'] = _motions.map((v) => v.toJson()).toList();
    return data;
  }
}

class MotionModel {
  int? motionId;
  int? timestamp;

  MotionModel({this.motionId, this.timestamp});

  MotionModel.fromJson(Map<String, dynamic> json) {
    motionId = json['motion_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['motion_id'] = motionId;
    data['timestamp'] = timestamp;
    return data;
  }
}