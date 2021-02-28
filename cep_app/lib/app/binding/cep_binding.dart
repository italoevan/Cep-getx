import 'package:cep_app/app/controller/cep_controller.dart';
import 'package:cep_app/app/data/provider/cep_provider.dart';
import 'package:cep_app/app/data/repository/cep_repository.dart';
import 'package:cep_app/app/utils/api_utils/requester.dart';
import 'package:get/get.dart';

class CepBinding implements Bindings {
  @override
  void dependencies() {
    Requester requester = Requester();
    Get.lazyPut<CepController>(() => CepController(
        repository:
            CepRepository(apiClient: CepApiClient(requester: requester))));
  }
}
