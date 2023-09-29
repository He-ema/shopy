import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assetData.dart';
import '../../../data/user_model/user_model.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Profile',
            style: styles.textStyle26,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const SpinKitSpinningLines(
                              color: kPrimaryColor,
                            ),
                            imageUrl: user.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            user.name,
                            style: styles.textStyle18,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            color: Colors.grey,
                            onPressed: () {},
                            child: const Text('Edit Profile'),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Account Details',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Card & offers',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Notifications',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Delivery information',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Payment information',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Language',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Privacy settings',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Logout',
                    style: styles.textStyle14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
