import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon = Icons.add,
    this.image,
    this.shape,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.padding = 15.0,
  });

  final VoidCallback? onTap;
  final BoxShape? shape;
  final Color? backgroundColor;
  final Color? iconColor;
  final double padding;
  final IconData icon;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.circle,
        color: backgroundColor,
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkResponse(
            splashColor: Colors.white,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Center(
                child: image ?? Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
