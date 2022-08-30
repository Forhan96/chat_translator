import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const DefaultContainer({
    Key? key,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
