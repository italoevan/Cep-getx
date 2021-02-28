import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/repository/cep_repository.dart';
import 'package:cep_app/app/utils/exception_utils/exception_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CepController extends GetxController {
  final CepRepository repository;
  CepController({this.repository});

  Rx<TextEditingController> cepController = TextEditingController().obs;
  var isLoading = false.obs;
  var error = "".obs;
  var validator = false.obs;

  onChange({String value}) {
    if (cepController.value.text.contains('-')) {
      if (value.length == 9) {
        error.value = null;
        validator.value = true;
      } else {
        error.value = "Cep invalido";
        validator.value = false;
      }
    } else {
      if (cepController.value.text.length == 8) {
        error.value = null;
        validator.value = true;
      } else {
        error.value = "Cep invalido";
        validator.value = false;
      }
    }
  }

  getCep() async {
    changeLoading();
    try {
      await repository.getAll(cepController.value.text).then((model) {
        changeLoading();
        Get.toNamed('/dados', arguments: model);
      });
    } catch (e) {
      changeLoading();
      showErrorDialog(e.toString());
    }
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
