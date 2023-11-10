import 'package:flutter/material.dart';
import 'package:flutter_binstagram/src/components/avatar_widget.dart';
import 'package:flutter_binstagram/src/components/image_data.dart';
import 'package:flutter_binstagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
            type: AvatarType.TYPE2,
            thumbPath: 'https://avatars.githubusercontent.com/u/87470206?v=4'),
        Positioned(
            right: 5,
            bottom: 5,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 3)),
              child: const Center(
                child: Text('+',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
              ),
            ))
      ],
    );
  }

  Widget _testStory() {
    return Stack(
      children: [
        AvatarWidget(
            type: AvatarType.TYPE2,
            thumbPath: 'https://avatars.githubusercontent.com/u/85450378?v=4')
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(
          width: 5,
        ),
        _myStory(),
        _testStory(),
        ...List.generate(
            5,
            (index) => AvatarWidget(
                type: AvatarType.TYPE1,
                thumbPath:
                    'https://avatars.githubusercontent.com/u/13654908?v=4'))
      ]),
    );
  }

  Widget _postList() {
    return Column(children: List.generate(5, (item) => PostWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: ImageData(
            IconsPath.logo,
            width: 270,
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ImageData(IconsPath.directMessage)))
          ]),
      body: ListView(children: [_storyBoardList(), _postList()]),
    );
  }
}
