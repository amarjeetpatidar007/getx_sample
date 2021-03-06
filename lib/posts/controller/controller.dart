import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_project/languages.dart';

import '../models/post_model.dart';
import '../services/api_service.dart';

class Controller extends GetxController {
  var indexTab = 0;
  var isLoading = true.obs;
  bool isDarken = Get.isDarkMode;
  String selectedLang = Languages.langs.first;
  List<Posts> posts = [];

  changeTab(int index) {
    indexTab = index;
    print(indexTab);
    update();
  }

  getPostList() async {
    posts = await NetworkService.getPosts();
    return posts;
  }

  createPost(int userId,String title, String body ) async{
    return await NetworkService.createPost(userId, title, body).then((value){
      Get.snackbar("Post Created! ", "${value.title} : ${value.body}");
    });
  }

  updatePost(int userId, int id, String title, String body) async {
    return await NetworkService.updatePost(userId, id, title, body)
        .then((value) {
      Get.snackbar("Post Updated! ", "${value.title} : ${value.body}");
    });
  }

  deletePost(int id) async {
    return await NetworkService.deleteUser(id: id)
        .then((value) => {Get.snackbar("Post Deleted!", " ")});
  }

  changeLanguage(String lang) {
    Languages.changeLocale(lang);
  }

  updateTheme() {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
    update();
  }
}
