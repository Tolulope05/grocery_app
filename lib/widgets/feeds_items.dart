import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/price_widget.dart';

import '../widgets/heart_btn.dart';
import '../widgets/text_widget.dart';

import '../services/utils.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final TextEditingController _finalQuantitycontroller =
      TextEditingController();
  @override
  void initState() {
    _finalQuantitycontroller.text = "1";
    super.initState();
  }

  void dispose() {
    _finalQuantitycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            print("Hello from FeedItems");
          },
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                height: size.width * .21,
                width: size.width * .2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Text",
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PriceWidget(),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Row(
                        children: [
                          TextWidget(
                            text: "KG",
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: TextFormField(
                              controller: _finalQuantitycontroller,
                              key: const ValueKey("10"),
                              style: TextStyle(
                                color: color,
                                fontSize: 18,
                              ),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity, // fits button to all container
                child: TextButton(
                  onPressed: () {
                    print("Text Button is pressed!");
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // To remove all the padding around a text button
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      )),
                  child: TextWidget(
                    text: "Add to Cart",
                    color: color,
                    textSize: 20,
                    maxLines: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
