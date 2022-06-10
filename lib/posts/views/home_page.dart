import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/posts/views/page2.dart';
import 'package:getx_project/posts/views/page3.dart';
import 'package:getx_project/posts/views/post_page.dart';

import '../../drawer.dart';
import '../controller/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) {
          return Scaffold(
            drawer: custDrawer(context),
            body: IndexedStack(
              index: controller.indexTab,
              children: const [Page2(), PostPage(), Page3()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTab,
              currentIndex: controller.indexTab,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Test2"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Test3")
              ],
            ),
          );
        });
  }
}
