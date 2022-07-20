import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/utils.dart';
import '../../widgets/feeds_items.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils(context).getScreenSize;
    final height = screenSize.height;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            print("Header tapped");
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        title: TextWidget(
          text: "Products on sale",
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: GridView.count(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: screenSize.width / (screenSize.height * .6),
        children: List.generate(16, (index) {
          return const FeedWidget();
        }),
      ),
    );
  }
}
