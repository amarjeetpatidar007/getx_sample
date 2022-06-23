import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/Auth/view/login_page.dart';
import 'package:getx_project/Auth/view/register_page.dart';
import 'package:getx_project/chat/view/chat_view.dart';
import 'package:getx_project/chat/view/landscape_chat_view.dart';
import 'package:getx_project/posts/views/create_post.dart';
import 'package:getx_project/posts/views/edit_post.dart';
import 'package:getx_project/posts/views/home_page.dart';
import 'package:getx_project/posts/views/page2.dart';

class Routes {
  static String home = "/home";
  static String editPage = "/editPage";
  static String testPage = '/testPage';
  static String createPage = '/createPage';
  static String loginPage = '/loginPage';
  static String signUpPage = '/SignUpPage';
  static String portraitChatPage = '/portraitChatPage';
  static String landscapeChatPage = '/landscapeChatPage';

  static String getHomeRoute() => home;

  static String getPage2Route() => testPage;

  static String getEditPostRoute() => editPage;

  static String getCreatePostRoute() => createPage;

  static String getLoginPage() => loginPage;

  static String getSignUpPage() => signUpPage;

  static String getPortraitChatPage() => portraitChatPage;

  static String getLandscapeChatPage() => landscapeChatPage;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: testPage, page: () => const Page2()),
    GetPage(name: editPage, page: () => const EditPage()),
    GetPage(name: createPage, page: () => const CreatePost()),
    GetPage(name: signUpPage, page: () => const RegisterPage()),
    GetPage(name: loginPage, page: () => const LoginPage()),
    GetPage(name: portraitChatPage, page: () => const ChatScreen()),
    GetPage(
        name: landscapeChatPage,
        page: () => const ChatViewLandscapeOrientation()),
  ];
}