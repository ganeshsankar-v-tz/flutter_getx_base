import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color color;

  const MyElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.color = const Color(0xFFFFCC00)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: color,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        textStyle: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w700,
        ),
      ),
      child: child,
    );
  }
}
