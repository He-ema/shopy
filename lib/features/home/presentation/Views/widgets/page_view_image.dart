import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../constants.dart';
import '../../../data/product_model/product_model.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
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
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          currentIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
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
                  ImageContainer(widget: widget, currentIndex: 0),
                  ImageContainer(widget: widget, currentIndex: 1),
                  ImageContainer(widget: widget, currentIndex: 2),
                ],
                controller: _controller,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
              ),
            ),
            const Spacer(),
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

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.widget,
    required this.currentIndex,
  });

  final PageViewImage widget;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(19)),
            child: CachedNetworkImage(
                imageUrl: widget.products[currentIndex].image!,
                placeholder: (context, url) => const SpinKitSpinningLines(
                      color: kPrimaryColor,
                    ),
                fit: BoxFit.fitWidth),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Popular',
              style: styles.textStyle12,
            ),
            Container(
              width: 100,
              child: Text(
                widget.products[currentIndex].name!,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: styles.textStyle14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
