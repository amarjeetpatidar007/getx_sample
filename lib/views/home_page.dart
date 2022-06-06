
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/controller.dart';
import 'package:getx_project/views/page1.dart';
import 'package:getx_project/views/page2.dart';
import 'package:getx_project/views/page3.dart';

import '../drawer.dart';

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
          children: const [
            PracticePage(),
            Page2(),
            Page3()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTab,
          currentIndex: controller.indexTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Practice"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Test series"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Syllabus")
          ],
        ),
    );
  }
    );
  }
}
