import 'package:flutter/material.dart';

class RoundedRectangularShadowPainter extends CustomPainter {
  Color borderColor;
  double borderWidth;
  Color shadowColor;
  double shadowWidth;
  double radius;
  RoundedRectangularShadowPainter(
      {required this.borderColor,
      required this.borderWidth,
      required this.shadowColor,
      required this.shadowWidth,
      required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final rrectBorder = RRect.fromRectAndRadius(
        Offset.zero & size, Radius.circular(this.radius));
    final rrectShadow = RRect.fromRectAndRadius(
        Offset(0, 1) & size, Radius.circular(this.radius));

    final shadowPaint = Paint()
      ..strokeWidth = this.shadowWidth
      ..color = this.shadowColor
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
    final borderPaint = Paint()
      ..strokeWidth = this.borderWidth
      ..color = this.borderColor
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrectShadow, shadowPaint);
    canvas.drawRRect(rrectBorder, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
