import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import '../widgets/text_widget.dart';
import '../widgets/on_sale_widget.dart';
import '../provider/dark_theme_provider.dart';

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
    return Scaffold(
      body: Column(
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
              color: Colors.amber,
              textSize: 22,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: screenSize.height * .24,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const OnSaleWidget();
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
