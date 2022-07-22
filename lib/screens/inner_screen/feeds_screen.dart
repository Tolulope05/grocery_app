import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../services/utils.dart';
import '../../widgets/feeds_items.dart';
import '../../widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/FeedsScreen";
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextfocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size screenSize = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "All Products",
          color: color,
          textSize: 20.0,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              focusNode: _searchTextfocusNode,
              controller: _searchTextController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.greenAccent,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.greenAccent,
                    width: 1,
                  ),
                ),
                hintText: "Whats in your mind?",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchTextController!.clear();
                    _searchTextfocusNode.unfocus();
                  },
                  icon: Icon(
                    Icons.close,
                    color: _searchTextfocusNode.hasFocus ? Colors.red : color,
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: screenSize.width / (screenSize.height * .6),
              children: List.generate(10, (index) {
                return const FeedWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
