import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/sevices/utils.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final Color color = Utils(context).color;

    return FittedBox(
      child: Row(
        children: [
          const TextWidget(text: "1.59\$", color: Colors.green, fontSize: 22),
          const SizedBox(
            width: 5,
          ),
          Text(
            "2.59\$",
            style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
