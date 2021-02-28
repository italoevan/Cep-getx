import 'package:cep_app/app/controller/cep_controller.dart';
import 'package:cep_app/app/ui/components/custom_button_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  CepController controller = Get.find<CepController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cep App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TextFormField(
                      onChanged: (value) {
                        controller.onChange(value: value);
                      },
                      controller: controller.cepController.value,
                      decoration: InputDecoration(
                          errorText: controller.error.value,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18))),
                    )),
                SizedBox(
                  height: Get.height / 40,
                ),
                CustomButtonHome(
                    controller: controller,
                    height: Get.height,
                    function: () => controller.getCep())
              ],
            ),
          ),
          Obx(() => controller.showLoading())
        ],
      ),
    );
  }
}
