import 'package:sesehat_flutter/models/chat.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

List<Chat> chatFeed() {
  List<Chat> chatList = new List(10);
  for (var i = 0; i < 10; i++) {
    chatList[i] =
        new Chat(lipsum.createWord(numWords: 2), lipsum.createSentence(), 4);
  }
  return chatList;
}
