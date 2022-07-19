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
  final TextEditingController _addressTextControllerr =
      TextEditingController(text: "");
  final TextEditingController _logoutTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    _addressTextControllerr.dispose();
    super.dispose();
  }

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
                const SizedBox(height: 15),
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
                  onPressed: () async {
                    await _showAddressDialog();
                  },
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
                  onPressed: () async {
                    await _showLogoutDialogue();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update"),
          content: TextField(
            // onChanged: (value) => print(
            //   "_addressTextControllerr.text ${_addressTextControllerr.text}",
            // ),
            controller: _addressTextControllerr,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutDialogue() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/warning-sign.png",
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 10),
                Text("Sign out"),
              ],
            ),
            content: const Text("Do you want to sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: "Cancel",
                  color: Colors.cyan,
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: "OK",
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }
}

Widget _listTile({
  required String title,
  String? subtitle,
  required IconData icon,
  required VoidCallback onPressed,
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
    onTap: onPressed,
  );
}
