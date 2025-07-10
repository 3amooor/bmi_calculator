import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final VoidCallback? onTap;

  const Reusablecard({ this.color,this.child,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: child,
      ),
    );
  }
}
