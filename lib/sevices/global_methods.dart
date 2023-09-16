import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter_app/widget/text_widget.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> showWarningDialog(
      {required String title,
      required String subTitle,
      required Function action,
      required BuildContext context}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                 Text(title)
              ],
            ),
            content: Text(subTitle),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: const TextWidget(
                    color: Colors.cyan,
                    text: "Cancel",
                    fontSize: 18,
                  )),
              TextButton(
                  onPressed: () {
                    action();
                  },
                  child: const TextWidget(
                    color: Colors.red,
                    text: "OK",
                    fontSize: 18,
                  ))
            ],
          );
        });
  }
}
