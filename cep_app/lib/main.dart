import 'package:cep_app/app/routes/app_pages.dart';
import 'package:cep_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.HOME,
    getPages: AppPages.listRoutes,
  ));
}
