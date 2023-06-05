import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja/config/routes/app.routes.dart';
import 'package:loja/config/routes/app_routes_pages.dart';
import 'package:loja/injections/main.injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initialRoute,
      getPages: AppRoutesPages.routesPages,
    );
  }
}
