import 'dart:convert' as JSON;
import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/utils/api_utils/requester.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CepApiClient {
  final http.Client httpClient;
  CepApiClient({@required this.httpClient});

  getCep(String cep) async {
        var response =
        await Requester().fetch(url: 'https://viacep.com.br/ws/${cep}/json/');
        if(response is http.Response){
          return response;
        }else{
         return  throw ('Ops, errou na quantidade de números');
        }
       
  }


}
