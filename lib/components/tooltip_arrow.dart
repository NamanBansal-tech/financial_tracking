import 'package:flutter/material.dart';

class TooltipArrow extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const TooltipArrow({
    super.key,
    required this.color,
    this.width = 14,
    this.height = 7,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _TrianglePainter(color),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height) // bottom-left
      ..lineTo(size.width / 2, 0) // 🔺 tip (top-center)
      ..lineTo(size.width, size.height) // bottom-right
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
