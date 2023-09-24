import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ClippedRectangle extends StatelessWidget {
  const ClippedRectangle({
    super.key,
    this.bottom = false,
  });
  final bool bottom;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottom
          ? MediaQuery.of(context).size.height * 0.41
          : MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottom ? const Color(0xffF7F8F9) : kPrimaryColor,
          borderRadius: bottom
              ? const BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(38),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(38),
                  bottomRight: Radius.circular(38))),
    );
  }
}

class SearchAndCamera extends StatelessWidget {
  const SearchAndCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            // height: 70,
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
              ),
            )),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.camera_alt_outlined,
            color: kPrimaryColor,
            size: 35,
          ),
        )
      ],
    );
  }
}
