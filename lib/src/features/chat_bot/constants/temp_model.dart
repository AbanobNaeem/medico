class TempChatModel {
  final String message;
  final String from;

  TempChatModel({required this.message, required this.from});
}

List<TempChatModel> tempChatList = [
  TempChatModel(message: "Hello Tasnim I’m Chatbot!", from: "bot"),
  TempChatModel(message: "How can I help you?", from: "bot"),
  TempChatModel(message: "Hello", from: "user"),
];
