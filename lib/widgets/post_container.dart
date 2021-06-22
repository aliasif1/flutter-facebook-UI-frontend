import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 6,),
                Text(
                  post.caption,
                ),
                if(post.imageUrl != null) SizedBox(height: 4,),
              ],
            ),
          ),
          if(post.imageUrl != null) Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: CachedNetworkImage(
              imageUrl: post.imageUrl,
            ),
          ),
          _PostStats(post:post),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key key,
    @required this.post
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${post.timeAgo}  ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          )
        ),
        InkWell(
          onTap: () => print('more option clicked'),
          child: Icon(
            Icons.more_horiz,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({
    Key key,
    @required this.post
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.facebookBlue
                ),
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 10,
                ),
              ),
              SizedBox(width: 4,),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 8,),
              Text(
                '${post.shares} Shares',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(child: _StatsButtons(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Like',
                onTap: () => print('Like'),
                ),
              ),
              Expanded(child: _StatsButtons(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Comment',
                onTap: () => print('Comment'),
              ),
              ),
              Expanded(child: _StatsButtons(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 25.0,
                ),
                label: 'Share',
                onTap: () => print('Share'),
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _StatsButtons extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _StatsButtons({
    Key key,
    this.icon,
    this.label,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 25,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 4,),
            Text(
              label
            )
          ],
        ),
      ),
    );
  }
}



