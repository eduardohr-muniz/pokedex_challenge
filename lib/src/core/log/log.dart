import 'package:logger/logger.dart';
import 'package:pokedex_challenge/src/core/log/conf_log.dart';

class Log extends Logger {
  Log({LogPrinter? printer}) : super(printer: printer);

  @override
  void d(message, [error, stackTrace]) {
    final log = ConfLog.d(message: message);
    logs.add(log);
    super.d(message, error, stackTrace);
  }

  @override
  void e(message, [error, stackTrace]) {
    final log = ConfLog.e(message: message);
    logs.add(log);
    super.e(message, error, stackTrace);
  }

  @override
  void i(message, [error, stackTrace]) {
    final log = ConfLog.i(message: message);
    logs.add(log);
    super.i(message, error, stackTrace);
  }

  @override
  void v(message, [error, stackTrace]) {
    final log = ConfLog.v(message: message);
    logs.add(log);
    super.v(message, error, stackTrace);
  }

  @override
  void w(message, [error, stackTrace]) {
    final log = ConfLog.w(message: message);
    logs.add(log);
    super.w(message, error, stackTrace);
  }

  @override
  void wtf(message, [error, stackTrace]) {
    final log = ConfLog.wtf(message: message);
    logs.add(log);
    super.wtf(message, error, stackTrace);
  }
}

List<ConfLog> logs = [];
