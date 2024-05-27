class BreastCancerModel {
  double? time;
  Image? image;
  Predictions? predictions;
  List<String>? predictedClasses;

  BreastCancerModel(
      {this.time, this.image, this.predictions, this.predictedClasses});

  BreastCancerModel.fromJson(Map<String, dynamic> json) {
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
  BENIGN? bENIGN;
  BENIGN? mALIGNANT;

  Predictions({this.bENIGN, this.mALIGNANT});

  Predictions.fromJson(Map<String, dynamic> json) {
    bENIGN =
        json['BENIGN'] != null ? BENIGN.fromJson(json['BENIGN']) : null;
    mALIGNANT = json['MALIGNANT'] != null
        ? BENIGN.fromJson(json['MALIGNANT'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bENIGN != null) {
      data['BENIGN'] = bENIGN!.toJson();
    }
    if (mALIGNANT != null) {
      data['MALIGNANT'] = mALIGNANT!.toJson();
    }
    return data;
  }
}

class BENIGN {
  double? confidence;

  BENIGN({this.confidence});

  BENIGN.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    return data;
  }
}
