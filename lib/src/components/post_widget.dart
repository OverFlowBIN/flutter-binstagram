import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_binstagram/src/components/avatar_widget.dart';
import 'package:flutter_binstagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
              type: AvatarType.TYPE3,
              size: 30,
              thumbPath:
                  'https://avatars.githubusercontent.com/u/85450378?v=4'),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl:
            'https://cdn.autotribune.co.kr/news/photo/202311/10357_53453_4930.png');
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              )
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'boyoung0212_official 외 41,255명이 좋아합니다',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          ExpandableText(
            '컨텐츠1입니다.',
            prefixText: 'overFlowBIN',
            // onPrefixTap: () {
            //   print('overFlowBIN 페이지로 이동');
            // },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            style: TextStyle(fontSize: 12),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 10,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          '댓글 234개 모두 보기',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        '1일전',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(children: [
        _header(),
        const SizedBox(
          height: 10,
        ),
        _image(),
        const SizedBox(
          height: 10,
        ),
        _infoCount(),
        const SizedBox(
          height: 5,
        ),
        _infoDescription(),
        const SizedBox(
          height: 5,
        ),
        _replyTextBtn(),
        const SizedBox(
          height: 5,
        ),
        _dateAgo()
      ]),
    );
  }
}
