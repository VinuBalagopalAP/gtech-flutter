import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  CustomCards({
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Widget onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                4,
              ),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => onPressed),
          );
        },
      ),
    );
  }
}
