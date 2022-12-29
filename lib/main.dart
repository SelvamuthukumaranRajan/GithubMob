import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'home/views/github_view.dart';
import 'home/bindings/github_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      initialRoute: "/github_view",
      initialBinding: GithubBinding(),
      getPages: [
        GetPage(
          name: '/github_view',
          transition: Transition.cupertino,
          page: () => const GithubView(),
        ),
      ],
    );
  }
}
