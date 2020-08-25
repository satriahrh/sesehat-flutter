import 'package:flutter/material.dart';
import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/utils/number.dart';

class LikeReaction extends StatefulWidget {
  final Post post;
  LikeReaction(this.post);

  @override
  _LikeReactionState createState() => _LikeReactionState();
}

class _LikeReactionState extends State<LikeReaction> {
  bool _iLiked;

  @override
  Widget build(BuildContext context) {
    if (_iLiked == null && widget?.post?.iLiked != null) {
      setState(() {
        _iLiked = widget.post.iLiked;
      });
    }
    final iLiked = _iLiked ?? false;
    final numberOfLikers = Text(
      humanizeNumber(widget.post.liked),
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.overline,
    );
    Icon icon = Icon(
      iLiked ? Icons.favorite : Icons.favorite_border,
      color: iLiked ? Colors.red : null,
    );
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            width: 40,
            child: IconButton(
              icon: icon,
              onPressed: () {
                if (_iLiked != null) {
                  setState(() {
                    _iLiked = iLiked ? false : true;
                  });
                  print('TODO: callback to backend service');
                }
              }),
          ),
          Container(
            child: widget.post.liked == 0
                ? numberOfLikers
                : InkWell(
                    onTap: () => print('TODO: go to likers list'),
                    child: numberOfLikers,
                  ),
            width: 40,
          )
        ],
      ),
    );
  }
}
