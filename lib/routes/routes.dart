import 'package:get/get.dart';
import 'package:notes_flutter_v2/layouts/main_layout.dart';
import 'package:notes_flutter_v2/views/create/create.dart';
import 'package:notes_flutter_v2/views/home/home.dart';
import 'package:notes_flutter_v2/views/view_edit/ViewEdit.dart';

class Routes {
  static String home = "/";
  static String create = '/create';
  static String viewEdit = '/view_edit';
  String currentRoute = '';

  static String getHomeRoute() => home;

  static String getCreateRoute() => create;

  static String getViewEditRoute() => viewEdit;

  static String getCurrentRoute() => Get.currentRoute;

  static bool isHomePage() {
    return getCurrentRoute() == home ? true : false;
  }

  static bool isCreatePage() {
    return getCurrentRoute() == create ? true : false;
  }

  static List<GetPage> routes = [
    GetPage(name: home, page: () => MainLayout(content: Home())),
    GetPage(name: create, page: () => MainLayout(content: Create())),
    GetPage(name: viewEdit, page: () => MainLayout(content: ViewEdit()))
  ];
}
