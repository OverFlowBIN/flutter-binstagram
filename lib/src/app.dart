// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_binstagram/src/components/image_data.dart';
import 'package:flutter_binstagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_binstagram/src/pages/home.dart';
import 'package:flutter_binstagram/src/pages/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(() => Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(index: controller.pageIndex.value, children: [
              const Home(),
              Navigator(
                key: controller.searchPageNavigationKey,
                onGenerateRoute: (routeSetting) {
                  return MaterialPageRoute(
                      builder: (context) => const Search());
                },
              ),
              Container(child: Center(child: Text('UPLOAD'))),
              Container(child: Center(child: Text('ACTIVITY'))),
              Container(child: Center(child: Text('MYPAGE'))),
            ]),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                currentIndex: controller.pageIndex.value,
                onTap: controller.changeBottomNav,
                items: [
                  BottomNavigationBarItem(
                      icon: ImageData(IconsPath.homeOff),
                      activeIcon: ImageData(IconsPath.homeOn),
                      label: 'home'),
                  BottomNavigationBarItem(
                      icon: ImageData(IconsPath.searchOff),
                      activeIcon: ImageData(IconsPath.searchOn),
                      label: 'home'),
                  BottomNavigationBarItem(
                      icon: ImageData(IconsPath.uploadIcon), label: 'home'),
                  BottomNavigationBarItem(
                      icon: ImageData(IconsPath.activeOff),
                      activeIcon: ImageData(IconsPath.activeOn),
                      label: 'home'),
                  BottomNavigationBarItem(
                      icon: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          )),
                      label: 'home'),
                ]),
          )),
    );
  }
}
