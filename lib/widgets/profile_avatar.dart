import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isOnline = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Palette.facebookBlue,
          radius: 20,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Palette.facebookBlue,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        if(isOnline) Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.online,
              border: Border.all(
                width: 2,
                color: Colors.white,
              )
            ),
          ),
        )
      ],
    );
  }
}
