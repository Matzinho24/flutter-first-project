import 'package:connect/widgets/standard_text.dart';
import 'package:flutter/cupertino.dart';

class IconAndText extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const IconAndText({super.key,
    required this.icon,
    required this.text,
    required this.iconColor, 
    this.textColor = const Color(0xFF332d2b),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 5),
        StandardText(text: text, color: textColor)
      ],
    );
  }
}
