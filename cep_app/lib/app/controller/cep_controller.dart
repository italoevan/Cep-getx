import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/repository/cep_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CepController extends GetxController {
  final CepRepository repository;
  CepController({this.repository});

  Rx<TextEditingController> cepController = TextEditingController().obs;
  var isLoading = false.obs;

  getCep() async {
    isLoading.value = true;
    var cepModel =
        await repository.getAll(cepController.value.text).then((model) {
      print(model.cep);
      isLoading.value = false;
      Get.toNamed('/dados', arguments: model);
    }).catchError((e) {
      isLoading.value = false;
      Get.dialog(AlertDialog(
        content: Container(
          child: Text("Error"),
        ),
      ));
    });
  }
}
