import 'package:flutter/material.dart';

class TaskBadge extends CustomPainter {
  final Color color;

  TaskBadge({ this.color });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = new Path()
      ..moveTo(-25, 0)
      ..relativeLineTo(30, size.height)
      ..lineTo(size.width, size.height)
      ..relativeLineTo(0, -size.height)
      ..close();
    final Paint paint = new Paint()
      ..color = color ?? Colors.white;

    canvas.drawPath(
      path,
      paint
    );
  }

  @override
  bool shouldRepaint(TaskBadge oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(TaskBadge oldDelegate) => false;
}
