import 'package:cep_app/app/bindings/cep_binding.dart';
import 'package:cep_app/app/routes/app_routes.dart';
import 'package:cep_app/app/ui/cep_dados.dart';
import 'package:cep_app/app/ui/pages/home_page.dart';
import 'package:get/get.dart';

class AppPages{
static List<GetPage> listRoutes = [
  GetPage(name: Routes.HOME, page: ()=> HomePage(),binding: CepBinding()),
  GetPage(name: Routes.DADOS, page: ()=> CepDados())
];

}