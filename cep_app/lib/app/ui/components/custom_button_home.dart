import 'package:cep_app/app/controller/cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonHome extends StatelessWidget {
  CustomButtonHome({@required this.controller,@required this.height, @required this.function,});
   CepController controller;
  double height;
  Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 15,
      child: Obx(()=>RaisedButton(
        color: Get.theme.primaryColor,
        child:
            Text("Buscar", style: TextStyle(color: Colors.white, fontSize: 25)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: controller.validator.value ? function : null,
      )),
    );
  }
}
