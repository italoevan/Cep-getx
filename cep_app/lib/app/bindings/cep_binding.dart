import 'package:cep_app/app/controller/cep_controller.dart';
import 'package:cep_app/app/data/provider/cep_provider.dart';
import 'package:cep_app/app/data/repository/cep_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CepBinding implements Bindings {
  @override
  void dependencies() {
    http.Client client = http.Client();
    Get.lazyPut<CepController>(
        () => CepController(repository: CepRepository(apiClient: CepApiClient(httpClient:client ))));
  }
}
