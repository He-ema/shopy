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
        margin: const EdgeInsets.only(top: 25, bottom: 10),
        height: 150,
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
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: PageView(
                children: [
                  Row(
                    children: [
                      Image.asset(AssetData.test),
                      Text('Air Max 2090'),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetData.test,
                      ),
                      Text('Air Max 2090'),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(AssetData.test),
                      Text('Air Max 2090'),
                    ],
                  ),
                ],
                controller: _controller,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
              ),
            ),
            Spacer(),
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
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
