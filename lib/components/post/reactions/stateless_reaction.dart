import 'package:flutter/material.dart';
import 'package:sesehat_flutter/utils/number.dart';

class StatelessReaction extends StatelessWidget {
  final int _number;
  final VoidCallback _onTapCallback;
  final IconData _iconData;

  StatelessReaction(this._number, this._iconData, this._onTapCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: GestureDetector(
        onTap: _onTapCallback,
              child: Row(
        children: [
          Container(
            width: 40,
            child: Icon(_iconData),
          ),
          Container(
            child: Text(
              humanizeNumber(_number),
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.overline,
            ),
            width: 40,
          )
        ],
      ),
      ),
    );
  }
}
