import 'package:flutter/material.dart';

class CirclularButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CirclularButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
          size: iconSize,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
