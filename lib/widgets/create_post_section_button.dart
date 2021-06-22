import 'package:flutter/material.dart';

class CreatePostSectionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Function onPressed;
  CreatePostSectionButton({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.iconSize,
    @required this.iconColor,
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      label: Text(
          label
      ),
    );
  }
}
