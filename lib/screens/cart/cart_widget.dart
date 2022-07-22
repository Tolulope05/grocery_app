import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/utils.dart';

class CartWidget extends StatefulWidget {
  CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final utils = Utils(context);
    Color color = utils.color;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: FancyShimmerImage(
              imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
              height: size.width * .25,
              width: size.width * .25,
              boxFit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Title",
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    _quantityController(
                      color: Colors.red,
                      icon: CupertinoIcons.minus,
                      function: () {},
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _quantityTextController,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9]"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _quantityTextController.text = "1";
                            } else {
                              return;
                            }
                          });
                        },
                      ),
                    ),
                    _quantityController(
                      color: Colors.green,
                      icon: CupertinoIcons.add,
                      function: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.cart_badge_minus,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const HeartButton(),
                TextWidget(
                  text: "\$0.29",
                  color: color,
                  textSize: 18,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityController({
    required IconData icon,
    required Function function,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () => function,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
