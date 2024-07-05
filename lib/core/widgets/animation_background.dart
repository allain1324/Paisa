import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBackground extends StatefulWidget {
  const AnimationBackground({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AnimationBackground> createState() => _AnimationBackgroundState();
}

class _AnimationBackgroundState extends State<AnimationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: SineCurve(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: AdvancedBackgroundPainter(_animation.value),
          child: widget.child,
        );
      },
    );
  }
}

class TexturedBackgroundPainter extends CustomPainter {
  final double animationValue;

  TexturedBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Animated gradient circle
    final gradientCircle = RadialGradient(
      colors: [Color(0xFFB19CD9), Color(0xFF6A5ACD)],
      stops: [0.2, 1.0],
    ).createShader(Rect.fromCircle(
      center: Offset(size.width * 0.2, size.height * 0.2),
      radius: 100 + sin(animationValue * 2 * pi) * 20,
    ));
    paint.shader = gradientCircle;
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.2),
      100 + sin(animationValue * 2 * pi) * 20,
      paint,
    );

    // Animated textured triangle
    paint.shader = null;
    paint.color = Color(0xFFFFC0CB);
    final trianglePath = Path()
      ..moveTo(size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width * 0.9, size.height * 0.3)
      ..lineTo(size.width * 0.7, size.height * 0.3)
      ..close();
    canvas.save();
    canvas.translate(
      sin(animationValue * 2 * pi) * 10,
      cos(animationValue * 2 * pi) * 10,
    );
    canvas.drawPath(trianglePath, paint);
    // Add texture to triangle
    for (var i = 0; i < 5; i++) {
      canvas.drawLine(
        Offset(size.width * (0.7 + i * 0.05), size.height * 0.3),
        Offset(size.width * (0.8 + i * 0.025), size.height * 0.2),
        Paint()
          ..color = Colors.white.withOpacity(0.5)
          ..strokeWidth = 1,
      );
    }
    canvas.restore();

    // Animated wavy pattern
    paint.color = Colors.white.withOpacity(0.2);
    final wavePath = Path();
    for (var i = 0; i < size.width; i += 20) {
      wavePath.lineTo(
        i.toDouble(),
        sin((i / 20 + animationValue * 2) * pi) * 10 + size.height * 0.8,
      );
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();
    canvas.drawPath(wavePath, paint);

    // Animated dashed circle
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    final dashedCircleCenter = Offset(size.width * 0.7, size.height * 0.6);
    final dashedCircleRadius = 50.0;
    for (var i = 0; i < 360; i += 15) {
      final angle = i * pi / 180;
      final rotatedAngle = angle + animationValue * 2 * pi;
      canvas.drawArc(
        Rect.fromCircle(center: dashedCircleCenter, radius: dashedCircleRadius),
        rotatedAngle,
        10 * pi / 180,
        false,
        paint,
      );
    }

    // Animated starburst
    paint.color = Color(0xFFFFD700);
    final starburstCenter = Offset(size.width * 0.2, size.height * 0.7);
    for (var i = 0; i < 12; i++) {
      final angle = i * pi / 6 + animationValue * 2 * pi;
      final outerRadius = 30 + sin(angle * 2) * 10;
      canvas.drawLine(
        starburstCenter,
        starburstCenter +
            Offset(cos(angle) * outerRadius, sin(angle) * outerRadius),
        paint..strokeWidth = 3,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimatedBackgroundPainter extends CustomPainter {
  final double animationValue;

  AnimatedBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Animate light purple circle
    paint.color = Color(0xFFB19CD9).withOpacity(0.5);
    double radius = 50 + sin(animationValue * 2 * pi) * 10;
    canvas.drawCircle(
        Offset(size.width * 0.1, size.height * (0.1 + animationValue * 0.05)),
        radius,
        paint);

    // Animate light pink circle
    paint.color = Color(0xFFFFC0CB).withOpacity(0.5);
    radius = 80 + cos(animationValue * 2 * pi) * 15;
    canvas.drawCircle(
        Offset(size.width * (0.85 - animationValue * 0.05), size.height * 0.2),
        radius,
        paint);

    // Animate overlapping circles
    paint.color = Color(0xFFB19CD9).withOpacity(0.5);
    canvas.drawCircle(
        Offset(size.width * (0.15 + animationValue * 0.05), size.height * 0.8),
        60,
        paint);
    paint.color = Color(0xFFFFC0CB).withOpacity(0.5);
    canvas.drawCircle(
        Offset(size.width * 0.25, size.height * (0.85 - animationValue * 0.05)),
        50,
        paint);

    // Animate white circles
    paint.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * (0.3 + animationValue * 0.05)),
        100,
        paint);
    canvas.drawCircle(
        Offset(size.width * (0.8 - animationValue * 0.05), size.height * 0.4),
        80,
        paint);

    // Animate star
    paint.color = Colors.white;
    final starCenter = Offset(size.width * (0.3 + animationValue * 0.05),
        size.height * (0.3 + sin(animationValue * 2 * pi) * 0.05));
    final starPath = Path()
      ..moveTo(starCenter.dx, starCenter.dy - 10)
      ..lineTo(starCenter.dx + 5, starCenter.dy - 5)
      ..lineTo(starCenter.dx + 10, starCenter.dy)
      ..lineTo(starCenter.dx + 5, starCenter.dy + 5)
      ..lineTo(starCenter.dx, starCenter.dy + 10)
      ..lineTo(starCenter.dx - 5, starCenter.dy + 5)
      ..lineTo(starCenter.dx - 10, starCenter.dy)
      ..lineTo(starCenter.dx - 5, starCenter.dy - 5)
      ..close();
    canvas.drawPath(starPath, paint);

    // Animate sunburst
    paint.color = Colors.white.withOpacity(0.5);
    final sunburstCenter = Offset(size.width * 0.9, size.height * 0.9);
    for (var i = 0; i < 12; i++) {
      final angle = i * pi / 6 + animationValue * 2 * pi;
      canvas.drawLine(
        sunburstCenter,
        sunburstCenter + Offset(cos(angle) * 30, sin(angle) * 30),
        paint..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SineCurve extends Curve {
  @override
  double transformInternal(double t) {
    return sin(pi * t) * 0.5 + 0.5;
  }
}

class AdvancedBackgroundPainter extends CustomPainter {
  final double animationValue;

  AdvancedBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Animated hexagon
    paint.color = Color(0xFFB19CD9).withOpacity(0.5);
    final hexagonCenter = Offset(size.width * 0.2, size.height * 0.3);
    final hexagonRadius = 50 + sin(animationValue * 2 * pi) * 10;
    drawHexagon(
        canvas, hexagonCenter, hexagonRadius, paint, animationValue * 2 * pi);

    // Animated triangle
    paint.color = Color(0xFFFFC0CB).withOpacity(0.5);
    final triangleCenter = Offset(size.width * 0.8, size.height * 0.2);
    final triangleSize = 60 + cos(animationValue * 2 * pi) * 15;
    drawTriangle(
        canvas, triangleCenter, triangleSize, paint, animationValue * 2 * pi);

    // Animated curved line
    paint.color = Colors.white.withOpacity(0.5);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    //drawAnimatedCurvedLine(canvas, size, paint, animationValue);

    // Animated concentric circles
    paint.color = Color(0xFFB19CD9).withOpacity(0.3);
    paint.style = PaintingStyle.stroke;
    drawConcentricCircles(canvas, Offset(size.width * 0.7, size.height * 0.8),
        paint, animationValue);

    // Animated floating dots
    paint.color = Color(0xFFFFC0CB).withOpacity(0.7);
    paint.style = PaintingStyle.fill;
    drawFloatingDots(canvas, size, paint, animationValue);
  }

  void drawHexagon(Canvas canvas, Offset center, double radius, Paint paint,
      double rotation) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 + rotation) * pi / 180;
      final point = center + Offset(cos(angle) * radius, sin(angle) * radius);
      i == 0
          ? path.moveTo(point.dx, point.dy)
          : path.lineTo(point.dx, point.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawTriangle(
      Canvas canvas, Offset center, double size, Paint paint, double rotation) {
    final path = Path();
    for (int i = 0; i < 3; i++) {
      final angle = (i * 120 + rotation) * pi / 180;
      final point = center + Offset(cos(angle) * size, sin(angle) * size);
      i == 0
          ? path.moveTo(point.dx, point.dy)
          : path.lineTo(point.dx, point.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawAnimatedCurvedLine(
      Canvas canvas, Size size, Paint paint, double animationValue) {
    final path = Path();
    path.moveTo(0, size.height * 0.5);
    for (double i = 0; i <= size.width; i++) {
      final y = size.height * 0.5 +
          sin((i / size.width * 4 * pi) + (animationValue * 2 * pi)) * 50;
      path.lineTo(i, y);
    }
    canvas.drawPath(path, paint);
  }

  void drawConcentricCircles(
      Canvas canvas, Offset center, Paint paint, double animationValue) {
    for (int i = 1; i <= 3; i++) {
      final radius = i * 30.0 * (1 + sin(animationValue * 2 * pi + i) * 0.2);
      canvas.drawCircle(center, radius, paint);
    }
  }

  void drawFloatingDots(
      Canvas canvas, Size size, Paint paint, double animationValue) {
    final random = Random(42); // Fixed seed for consistent randomness
    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;
      final y = baseY +
          sin((animationValue * 2 * pi) + (x / size.width * 4 * pi)) * 20;
      canvas.drawCircle(Offset(x, y), 3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
