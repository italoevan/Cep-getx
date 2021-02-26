import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CepDados extends StatelessWidget {
  CepModel cepModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações sobre seu cep"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Cep"),
            subtitle: Text(cepModel.cep),
          ),
          ListTile(
            title: Text("Logradouro"),
            subtitle: Text(cepModel.logradouro),
          ),
          ListTile(
            title: Text("Localidade"),
            subtitle: Text(cepModel.localidade),
          ),
          ListTile(
            title: Text("Bairro"),
            subtitle: Text(cepModel.bairro),
          ),
          ListTile(title:Text("DDD"), subtitle: Text(cepModel.ddd),)
        ],
      ),
    );
  }
}
