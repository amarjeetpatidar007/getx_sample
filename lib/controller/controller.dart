

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var indexTab = 0;

  changeTab(int index){
    indexTab = index;
    update();
  }


   updateTheme() {
     Get.changeTheme(
       Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
     );
    update();
  }


}