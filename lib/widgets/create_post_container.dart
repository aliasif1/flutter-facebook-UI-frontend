import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/widgets/create_post_section_button.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              SizedBox(width: 8,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              )
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CreatePostSectionButton(label: 'Live', icon: Icons.videocam, iconSize: 25, iconColor: Colors.red, onPressed: ()=>print('Live Button Pressed')),
                VerticalDivider(width: 8,),
                CreatePostSectionButton(label: 'Photo', icon: Icons.photo_library, iconSize: 25, iconColor: Colors.green, onPressed: ()=>print('Photo Button Pressed')),
                VerticalDivider(width: 8,),
                CreatePostSectionButton(label: 'Room', icon: Icons.video_call, iconSize: 25, iconColor: Colors.purpleAccent, onPressed: ()=>print('Room Button Pressed')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
