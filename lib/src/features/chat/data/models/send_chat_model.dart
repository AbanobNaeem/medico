class SendChatModel {
  int? senderID;
  int? receiverID;
  String? content;
  String? timestamp;

  SendChatModel({this.senderID, this.receiverID, this.content, this.timestamp});

  SendChatModel.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    receiverID = json['receiverID'];
    content = json['content'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderID'] = senderID;
    data['receiverID'] = receiverID;
    data['content'] = content;
    data['timestamp'] = timestamp;
    return data;
  }
}