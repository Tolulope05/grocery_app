import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../provider/dark_theme_provider.dart';

import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hi, ",
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Tolulope",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("My name is Tolulope");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextWidget(
                  // isTitle: true,
                  text: "email@email.com",
                  color: color,
                  textSize: 18,
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const SizedBox(height: 20),
                _listTile(
                  title: "Address 2",
                  subtitle: "My subtitle",
                  color: color,
                  icon: IconlyLight.profile,
                  onPressed: () {},
                ),
                _listTile(
                  title: "Orders",
                  color: color,
                  icon: IconlyLight.bag,
                  onPressed: () {},
                ),
                _listTile(
                  title: "WishList",
                  color: color,
                  icon: IconlyLight.heart,
                  onPressed: () {},
                ),
                _listTile(
                  title: "Forget Password",
                  color: color,
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                ),
                _listTile(
                  title: "viewed",
                  color: color,
                  icon: IconlyLight.show,
                  onPressed: () {},
                ),
                SwitchListTile(
                  title: TextWidget(
                    // isTitle: true,
                    text: themeState.getDarkTheme ? "Dark mode" : "Light mode",
                    color: color,
                    textSize: 22,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTile(
                  title: "Logout",
                  color: color,
                  icon: IconlyLight.logout,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _listTile({
  required String title,
  String? subtitle,
  required IconData icon,
  required Function onPressed,
  required Color color,
}) {
  return ListTile(
    title: TextWidget(
      // isTitle: true,
      text: title,
      color: color,
      textSize: 22,
    ),
    subtitle: TextWidget(
      text: subtitle ?? "",
      color: color,
      textSize: 18,
    ),
    leading: Icon(icon),
    trailing: const Icon(IconlyLight.arrowRight2),
    onTap: () => onPressed,
  );
}
