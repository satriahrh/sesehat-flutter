import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/models/user.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

List<Post> postFeed() {
  List<Post> postList = new List(10);
  for (var i = 0; i < 10; i++) {
    User author = new User(lipsum.createWord(numWords: 3));
    postList[i] = Post(author, lipsum.createParagraph(numParagraphs: 9),
        lipsum.createWord(numWords: 3), 1598003960);
  }
  return postList;
}
