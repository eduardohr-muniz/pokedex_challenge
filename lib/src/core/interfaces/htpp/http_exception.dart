// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokedex_challenge/src/core/helpers/server_exception.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/http_response.dart';

class HttpExceptionCustom implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  HttpResponse response;

  HttpExceptionCustom({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    String defaul = '⚠️ERROR: \n$error';
    if (statusCode != null) {
      String? httpMessage = ServerException.exeptionEquals(statusCode!);
      if (httpMessage != null) {
        return httpMessage;
      } else {
        return defaul;
      }
    }
    return defaul;
  }
}
