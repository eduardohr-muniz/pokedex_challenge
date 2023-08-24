import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/htpp_exception.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/http_response.dart';
import '../../log/log.dart';
import 'i_http.dart';

class HttpDio implements IHttp {
  late final Dio _dio;
  final log = Log(printer: PrettyPrinter());

  HttpDio({BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  final _defaultOptions = BaseOptions(
    baseUrl: "https://pokeapi.co",
  );

  @override
  IHttp auth() {
    _defaultOptions.extra["auth_required"] = true;
    return this;
  }

  @override
  IHttp unauth() {
    _defaultOptions.extra["auth_required"] = false;
    return this;
  }

  @override
  Future<HttpResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      // _logInfo(path, "GET", queryParamters: query);
      // DateTime start = DateTime.now();
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: Options(headers: headers),
      );
      // DateTime end = DateTime.now();
      // _logResponse(path, "GET", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> request<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  Future<HttpResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return HttpResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _trowRestClientException(DioException dioError) {
    final response = dioError.response;
    throw HttpExeption(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: HttpResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }

  _logInfo(String path, String methodo, {Map<String, dynamic>? queryParamters, dynamic data}) {
    log.d('METHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nQUERYPARAMTERS: $queryParamters \nDATA: $data');
  }

  _logResponse(String path, String methodo, {Response? response, String? time}) {
    if (response?.statusCode == 200) {
      log.d(
          '[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response?.data}');
    } else {
      log.e(
          '[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response?.data}');
    }
  }
}
