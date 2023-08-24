import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    const double radius = 20.0;
    path.lineTo(0, 70 + radius);
    path.quadraticBezierTo(0, 75, radius, 70);
    path.lineTo(size.width - radius, 4);
    path.quadraticBezierTo(size.width, 0, size.width, 0 + radius);
    path.lineTo(size.width, 0);
    path.close(); // Fecha o caminho

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Não é necessário recriar o corte quando o widget é atualizado
  }
}
