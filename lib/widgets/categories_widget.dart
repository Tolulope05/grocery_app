import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red.withOpacity(0.7),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print("Categories Pressed!");
            },
            child: Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cat/veg.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          TextWidget(
            text: "Category name",
            color: color,
            textSize: 16,
          ),
        ],
      ),
    );
  }
}
