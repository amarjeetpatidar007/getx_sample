
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/posts/views/create_post.dart';
import 'package:getx_project/posts/views/edit_post.dart';
import 'package:getx_project/posts/views/home_page.dart';
import 'package:getx_project/posts/views/page2.dart';

class Routes{
  static String home = "/";
  static String editPage = "/editPage";
  static String testPage = '/testPage';
  static String createPage = '/createPage';


  static String getHomeRoute() => home;
  static String getPage2Route() => testPage;
  static String getEditPostRoute() => editPage;
  static String getCreatePostRoute() => createPage;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: testPage, page: () => const Page2()),
    GetPage(name: editPage, page: () => const EditPage()),
    GetPage(name: createPage, page: () => const CreatePost()),
  ];
}