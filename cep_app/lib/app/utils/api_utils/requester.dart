import 'package:cep_app/app/utils/api_utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:path/path.dart';
import 'dart:io';

class Requester {
  Map basicHeaders = Headers().getBasicHeader();

  fetch({@required String url, Map header}) async {
    try {
      var response =
          await http.get(url, headers: header == null ? basicHeaders : header);
      verifyStatusCode(response);
      return response;
    } catch (e) {
      return e;
    }
  }

  verifyStatusCode(http.Response _response) {
    if (_response.body == "") {
      throw new Exception('Empty body');
    } 
  }
}
