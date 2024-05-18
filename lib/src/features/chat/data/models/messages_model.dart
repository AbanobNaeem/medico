class MessagesModel {
  int? userId;
  String? username;
  String? profileImage;
  LastMessage? lastMessage;

  MessagesModel(
      {this.userId, this.username, this.profileImage, this.lastMessage});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    profileImage = json['profileImage'];
    lastMessage = json['lastMessage'] != null
        ? LastMessage.fromJson(json['lastMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['profileImage'] = profileImage;
    if (lastMessage != null) {
      data['lastMessage'] = lastMessage!.toJson();
    }
    return data;
  }
}

class LastMessage {
  String? content;
  String? timestamp;

  LastMessage({this.content, this.timestamp});

  LastMessage.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['timestamp'] = timestamp;
    return data;
  }
}