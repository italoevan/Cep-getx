import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/provider/cep_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class CepRepository {
  final CepApiClient apiClient;

  CepRepository({this.apiClient});

  Future<dynamic> getAll(String cep) async {
    http.Response response = await apiClient.getCep(cep);

    var jsonData = JSON.jsonDecode(response.body);

    if (jsonData['erro'] == null) {
      return CepModel.fromJson(jsonData);
    } else if (jsonData['erro'] != null) {
      return throw ('Insira um Cep válido.');
    } else if (jsonData == null) {
      return throw ('Insira um Cep válido.');
    }
  }
}
