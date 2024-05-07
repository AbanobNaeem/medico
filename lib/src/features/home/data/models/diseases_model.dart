class BoneFracturesModel {
  final double time;
  final ImageData image;
  final List<Prediction> predictions;
  final String top;
  final double confidence;

  BoneFracturesModel({
    required this.time,
    required this.image,
    required this.predictions,
    required this.top,
    required this.confidence,
  });

  factory BoneFracturesModel.fromJson(Map<String, dynamic> json) {
    return BoneFracturesModel(
      time: json['time'],
      image: ImageData.fromJson(json['image']),
      predictions: (json['predictions'] as List)
          .map((prediction) => Prediction.fromJson(prediction))
          .toList(),
      top: json['top'],
      confidence: json['confidence'],
    );
  }
}

class ImageData {
  final int width;
  final int height;

  ImageData({required this.width, required this.height});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      width: json['width'],
      height: json['height'],
    );
  }
}

class Prediction {
  final String classType;
  final int classId;
  final double confidence;

  Prediction({
    required this.classType,
    required this.classId,
    required this.confidence,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      classType: json['class'],
      classId: json['class_id'],
      confidence: json['confidence'],
    );
  }
}
