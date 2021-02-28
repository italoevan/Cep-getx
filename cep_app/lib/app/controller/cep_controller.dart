import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/repository/cep_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CepController extends GetxController {
  final CepRepository repository;
  CepController({this.repository});

  Rx<TextEditingController> cepController = TextEditingController().obs;
  var isLoading = false.obs;

  getCep() async {
    changeLoading();
    await repository.getAll(cepController.value.text).then((model) {
      changeLoading();
      Get.toNamed('/dados', arguments: model);
    }).catchError((error) {
      changeLoading();
      showErrorDialog(error.toString());
    });
  }

  showErrorDialog(String error) {
    return Get.dialog(AlertDialog(
      content: Container(
        child: Text(error),
      ),
    ));
  }

  Widget showLoading() {
    if (isLoading.value) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  changeLoading() => isLoading.value = !isLoading.value;
}
