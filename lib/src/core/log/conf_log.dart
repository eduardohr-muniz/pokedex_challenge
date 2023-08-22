import 'package:flutter/material.dart';

class ConfLog {
  final String message;
  final IconData icon;
  final Color color;
  final String title;

  ConfLog.d({required this.message})
      : icon = Icons.code,
        color = Colors.blue,
        title = 'Debug';

  ConfLog.e({required this.message})
      : icon = Icons.block,
        color = Colors.red,
        title = 'Error';

  ConfLog.i({required this.message})
      : icon = Icons.info,
        color = Colors.green,
        title = 'Info';

  ConfLog.v({required this.message})
      : icon = Icons.abc,
        color = Colors.purple,
        title = 'Verbose';

  ConfLog.w({required this.message})
      : icon = Icons.warning,
        color = Colors.amber,
        title = 'Warning';

  ConfLog.wtf({required this.message})
      : icon = Icons.warning,
        color = Colors.orange,
        title = 'What a Terrible Failure';
}
