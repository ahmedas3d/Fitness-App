import 'dart:math';
import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int total;
  final int current;

  const CustomProgressIndicator({
    super.key,
    required this.total,
    required this.current,
    required int progress,
  });

  @override
  Widget build(BuildContext context) {
    double progress = current / total;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 50.w,
          height: 40.h,
          child: CustomPaint(painter: ArcPainter(progress)),
        ),
        Text(
          "$current/$total",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color =
              AppColors
                  .mainColor // غير اللون حسب الحاجة
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round;

    double startAngle = pi; // يبدأ من النصف السفلي
    double sweepAngle = pi * progress; // يزداد تدريجياً حتى 1 (يعني π)

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
