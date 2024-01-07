import 'package:flutter/cupertino.dart';

class StandardText extends StatelessWidget {

  final Color? color;
  final String text;
  double size;
  double height;

  StandardText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 12,
    this.height = 1.1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          height: height
      ),
    );
  }
}
