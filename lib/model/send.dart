import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SendCustomBubble extends StatelessWidget {
  String massage;
  Color color;
  Color strokColor;
  double strokWidth;
  

  SendCustomBubble({
    super.key,
    required this.massage,
    required this.color,
    required this.strokColor,
    required this.strokWidth
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BorderPainter(color: strokColor,strokeWidth:strokWidth ),
            ),
          ),
          ClipPath(
            clipper: CarveClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 8,
              decoration: BoxDecoration(
                color: color,
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(massage),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for the shape
class CarveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;
    double marginBottom = height * 2 / 10;

    // Create the clipped shape
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, width, height - marginBottom),
        Radius.circular(10)));

    // Create custom lines
    path.lineTo((width / 8) + marginBottom, height - marginBottom);
    path.lineTo(width / 10, height);
    path.lineTo((width / 7) - marginBottom, height - marginBottom);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

// Custom Painter for drawing the border
class BorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;


  BorderPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Path borderPath =
        CarveClipper().getClip(size); // Use the same path for the border
    canvas.drawPath(borderPath, paint); // Draw the border
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
