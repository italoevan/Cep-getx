import 'dart:convert' as JSON;
import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CepApiClient {
  final http.Client httpClient;
  CepApiClient({@required this.httpClient});

  Future<CepModel>fetch(String cep) async {
    var response = await http.get('https://viacep.com.br/ws/${cep}/json/');
    if (response.statusCode == 200) {
      Map<String, dynamic> map = JSON.jsonDecode(response.body);
      CepModel model = CepModel.fromJson(map);
      return model;
    } else {
      return null;
    }
  }
}
