import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    @required this.photoUrl,
    @required this.radius,
    this.borderColor,
    this.borderWidth,
    this.onPressed,
  });
  final String photoUrl;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _borderDecoration(),
      child: InkWell(
        onTap: onPressed,
        //borderRadius: BorderRadius.circular(radius * 1.2),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.black12,
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
          child: photoUrl == null ? Icon(Icons.camera_alt, size: radius) : null,
        ),
      ),
    );
  }

  Decoration _borderDecoration() {
    if (borderColor != null && borderWidth != null) {
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      );
    }
    return null;
  }
}
