import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_flutter_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import '../widget/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                    text: "Hi,  ",
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Dwayne",
                          style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600)
                        // recognizer: TapAndPanGestureRecognizer()
                        //   ..onTapUp = () {}
                      ),
                    ]),
              ),
              TextWidget(text: "dwayne@gmail.com", color: color, fontSize: 18),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                  title: "Address",
                  iconData: IconlyLight.profile,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Orders",
                  iconData: IconlyLight.bag,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Wishlist",
                  iconData: IconlyLight.heart,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Forget Password",
                  iconData: IconlyLight.unlock,
                  color: color,
                  onPressed: () {}),
              SwitchListTile(
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  title:  TextWidget(
                      text: themeState.getDarkTheme? "Dark Mode":"Light Mode",
                      color: color, fontSize: 18),

                  secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_rounded)),
          _listTiles(
              title: "Logout",
              iconData: IconlyLight.logout,
              color: color,
              onPressed: () {}),
          ],
        ),
      ),
    ),)
    );
  }

  Widget _listTiles({required String title,
    String? subtitle,
    required IconData iconData,
    required Color color,
    required Function onPressed}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        fontSize: 22,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        fontSize: 18,
      ),
      leading: Icon(iconData),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: onPressed(),
    );
  }
}
