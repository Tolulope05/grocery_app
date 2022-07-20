import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';
import '../widgets/feeds_items.dart';
import '../widgets/text_widget.dart';
import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    "assets/images/offres/Offer1.jpg",
    "assets/images/offres/Offer2.jpg",
    "assets/images/offres/Offer3.jpg",
    "assets/images/offres/Offer4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Size screenSize = Utils(context).getScreenSize;
    final height = screenSize.height;
    final Color color = Utils(context).color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
                control: const SwiperControl(color: Colors.amber),
                autoplay: true,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {
                print("Print all is pressed!");
              },
              child: TextWidget(
                text: "View all",
                color: Colors.blue,
                textSize: 22,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On sale".toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SizedBox(
                    height: screenSize.height * .26,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(
                    text: "Our Products",
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      text: "Browse all",
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  )
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: screenSize.width / (screenSize.height * .6),
              children: List.generate(4, (index) {
                return const FeedWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
