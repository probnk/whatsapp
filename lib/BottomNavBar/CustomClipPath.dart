import 'package:flutter/cupertino.dart';

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(width*0.1, 0);
    path.lineTo(0, height);
    path.lineTo(width,height);
    path.lineTo(width*0.9, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}