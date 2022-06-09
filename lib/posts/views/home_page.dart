import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/posts/views/page2.dart';
import 'package:getx_project/posts/views/page3.dart';
import 'package:getx_project/posts/views/post_page.dart';

import '../../drawer.dart';
import '../controller/controller.dart';

class HomePage extends GetView<Controller> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            drawer: custDrawer(context),
            body: IndexedStack(
              index: controller.indexTab,
              children: const [
                PostPage(),
                Page2(),
                Page3()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTab,
              currentIndex: controller.indexTab,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Practice"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Test series"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Syllabus")
              ],
            ),
          );
  }
}
