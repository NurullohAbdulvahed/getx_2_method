import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_2_method/pages/create_page.dart';
import 'package:getx_2_method/services/binding.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialBinding: ControllersBinding(),
      home: const HomePage(),
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage()),
        GetPage(name: "/CreatePage", page: () => const CreatePage())
      ],
    );
  }
}

