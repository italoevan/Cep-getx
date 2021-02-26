import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonHome extends StatelessWidget {
  CustomButtonHome({@required this.height, @required this.function});
  double height;
  Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 15,
      child: RaisedButton(
        color: Get.theme.primaryColor,
        child:
            Text("Buscar", style: TextStyle(color: Colors.white, fontSize: 25)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: function,
      ),
    );
  }
}
