import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    // 툴을 미리 만들고 나중에 이미지를 넣어주는 방삭
    super.initState();
    for (var i = 0; i < 99; i++) {
      groupIndex.indexOf(min<int>(groupIndex)!);
      var gi = i % 3;
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef)),
            child: const Row(children: [
              Icon(Icons.search),
              Text('검색',
                  style: TextStyle(fontSize: 15, color: Color(0xff838383)))
            ]),
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(15.0), child: Icon(Icons.location_pin))
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                groupBox.length,
                (index1) => Expanded(
                      child: Column(
                        children: List.generate(
                          groupBox[index1].length,
                          (index2) => Container(
                            height: Get.width * 0.33 * groupBox[index1][index2],
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)]),
                            child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.pinimg.com/736x/90/2d/4f/902d4f2f87c36c1e978fb1ba5b2159bb.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                        // children: [
                        // Container(
                        //   height: Get.width * 0.33 * groupBox[index],
                        //   color: Colors.red,
                        // ),
                        // ],
                      ),
                    )).toList()
            //[
            // Expanded(
            // child: Column(
            //   children: [
            //     Container(
            //       height: 140,
            //       color: Colors.red,
            //     )
            //   ],
            // ),
            // ),
            // Expanded(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 140,
            //         color: Colors.blue,
            //       )
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 140,
            //         color: Colors.grey,
            //       )
            //     ],
            //   ),
            // ),
            // ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _appbar(),
          Expanded(
            child: _body(),
          )
        ],
      ),
    ));
  }
}
