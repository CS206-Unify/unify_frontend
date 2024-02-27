import 'package:flutter/material.dart';

class LoginBgPaint extends CustomPainter {
  LoginBgPaint({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
