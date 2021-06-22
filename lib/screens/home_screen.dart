import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/data/data.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CirclularButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print('Search Icon Pressed'),
              ),
              CirclularButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () => print('Facebook messenger Icon Pressed'),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser,),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0,10,0,5),
            sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers,)
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0,5,0,5),
            sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories,)
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index){
              final Post post = posts[index];
              return PostContainer(post: post);
            },
              childCount: posts.length,
            )
          )
        ],
      ),
    );
  }
}
