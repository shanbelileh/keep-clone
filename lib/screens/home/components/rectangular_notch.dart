import 'package:flutter/material.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class RectangularNotch extends NotchedShape {
  double shapeRadius;
  double margin;
  double gap;

  RectangularNotch({this.shapeRadius = 18, this.margin = 5, this.gap = 20});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    guest = Rect.fromLTWH(
        guest.left, guest.top, guest.width - gap, guest.height - gap);

    return Path()
      ..moveTo(host.left, host.top)
      ..moveTo(host.left, host.top)
      ..lineTo(guest.left - margin, host.top)
      ..cubicTo(guest.left - margin, host.top, guest.left, host.top, guest.left,
          margin)
      ..lineTo(guest.left, guest.bottom - shapeRadius)
      ..cubicTo(guest.left, guest.bottom - shapeRadius, guest.left,
          guest.bottom, guest.left + shapeRadius, guest.bottom)
      ..lineTo(guest.right - shapeRadius, guest.bottom)
      ..cubicTo(guest.right - shapeRadius, guest.bottom, guest.right,
          guest.bottom, guest.right, guest.bottom - shapeRadius)
      ..lineTo(guest.right, host.top + margin)
      ..cubicTo(guest.right, host.top + margin, guest.right, host.top,
          guest.right + margin, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
