
import 'dart:io';

import 'package:get/get.dart';

class Headers{

  Map<String, String> getBasicHeader(){
    return {
      "OS" : Platform.isAndroid ? "Android" : "iOS",
      "Content-Type" : "application/json"
    };
  }

}