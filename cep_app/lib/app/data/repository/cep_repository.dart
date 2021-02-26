import 'package:cep_app/app/data/models/cep_model.dart';
import 'package:cep_app/app/data/provider/cep_provider.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as JSON;
class CepRepository {
  final CepApiClient apiClient;

  CepRepository({this.apiClient});

  Future<CepModel> getAll(String cep) async{
  
  return apiClient.fetch(cep);

  }
}
