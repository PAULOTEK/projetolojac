import 'package:get/get.dart';
import 'package:loja/config/routes/app.routes.dart';
import 'package:loja/modules/module_home/pages/home.page.dart';
import 'package:loja/modules/module_login/pages/login.page.dart';

class AppRoutesPages {
  static final routesPages = [
    GetPage(name: Routes.initialRoute, page: () => LoginPage()),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
  ];
}
