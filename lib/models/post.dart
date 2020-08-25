import 'dart:math';

import 'package:sesehat_flutter/models/user.dart';

class Post {
  User author;
  String body, scope;
  bool iLiked = true;
  int createdAt, liked, commented, shared;
  final Random random = new Random(DateTime.now().millisecondsSinceEpoch);

  Post(User author, String body, String scope, int createdAt) {
    this.author = author;
    this.createdAt = createdAt;
    this.body = body;
    this.scope = scope;
    this.liked = random.nextInt(9999999);
    this.commented = random.nextInt(9999999);
    this.shared = random.nextInt(9999999);
  }
}
