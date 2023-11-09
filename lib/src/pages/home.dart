import 'package:flutter/material.dart';
import 'package:flutter_binstagram/src/components/avatar_widget.dart';
import 'package:flutter_binstagram/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              100,
              (index) => AvatarWidget(
                  type: AvatarType.TYPE1,
                  thumbPath:
                      'https://mblogthumb-phinf.pstatic.net/MjAxOTEyMjdfOTgg/MDAxNTc3NDU3MTA1MjY1.h8Z8BGzOj97L7vSX0R-gwS_pvSyfcOEdpVa7j39rM7sg.xioiVY4XeVCTxrLzw_XjdMITlKQauMLkbx6nkBHufeEg.PNG.hoonmom29/%E3%85%81.png?type=w800'))),
    );
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
      body: ListView(children: [_storyBoardList()]),
    );
  }
}
