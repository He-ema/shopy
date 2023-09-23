import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assetData.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    super.key,
  });

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _controller.animateToPage(
        currentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 160,
              child: PageView(
                children: [
                  Image.asset(AssetData.success),
                  Image.asset(AssetData.success),
                  Image.asset(AssetData.success),
                ],
                controller: _controller,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: index == currentIndex
                              ? kPrimaryColor
                              : kPrimaryColor.withOpacity(0.5),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
