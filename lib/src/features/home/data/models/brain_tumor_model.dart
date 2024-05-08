
class BrainTumorModel {
  double? time;
  Image? image;
  Predictions? predictions;
  List<String>? predictedClasses;

  BrainTumorModel(
      {this.time, this.image, this.predictions, this.predictedClasses});

  BrainTumorModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    predictions = json['predictions'] != null
        ? Predictions.fromJson(json['predictions'])
        : null;
    predictedClasses = json['predicted_classes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (predictions != null) {
      data['predictions'] = predictions!.toJson();
    }
    data['predicted_classes'] = predictedClasses;
    return data;
  }
}

class Image {
  int? width;
  int? height;

  Image({this.width, this.height});

  Image.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Predictions {
  Healthy? healthy;
  Healthy? tumor;

  Predictions({this.healthy, this.tumor});

  Predictions.fromJson(Map<String, dynamic> json) {
    healthy =
        json['Healthy'] != null ? Healthy.fromJson(json['Healthy']) : null;
    tumor = json['Tumor'] != null ? Healthy.fromJson(json['Tumor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (healthy != null) {
      data['Healthy'] = healthy!.toJson();
    }
    if (tumor != null) {
      data['Tumor'] = tumor!.toJson();
    }
    return data;
  }
}

class Healthy {
  double? confidence;

  Healthy({this.confidence});

  Healthy.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    return data;
  }
}
