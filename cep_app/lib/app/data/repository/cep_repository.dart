import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/provider/cep_provider.dart';
import 'dart:convert' as JSON;

class CepRepository {
  final CepApiClient apiClient;

  CepRepository({this.apiClient});

  Future<dynamic> getAll(String cep) async {
    try {
      dynamic response = await apiClient.getCep(cep);
      var jsonData = JSON.jsonDecode(response.body);
      if (jsonData['erro'] == null) {
        CepModel cepModel = CepModel.fromJson(jsonData);
        return cepModel;
      } else {
        return throw Exception("Error");
      }
    } catch (e) {
      return throw Exception(e);
    }

    /*
    dynamic response = await apiClient.getCep(cep);
    if (response is http.Response) {
      //Caso retorne json
      var jsonData = JSON.jsonDecode(response.body);
      if (jsonData['erro'] != null) {
        //Retorna json mas com erro (Quando o usuario insere 8 numeros mas não é um cep válido)
        return throw ('Error');
      }
      //Caso seja um cep válido
      CepModel cepModel = CepModel.fromJson(jsonData);
      return cepModel;
    } else {
      //Usuário errou na quantidade de numeros
      return throw ('Error');
    }
    */
  }
}
