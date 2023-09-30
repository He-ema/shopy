import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/profile/presentation/views/widgets/bottom_sheet_body.dart';

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
                            onPressed: () {
                              showModalBottomSheet(
                                enableDrag: true,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                )),
                                context: context,
                                builder: (context) {
                                  return BottomSheetBody(
                                    userModel: user,
                                  );
                                },
                              );
                            },
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
                  const ProfileItem(text: 'Account Details'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Card & offers'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Notifications'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Delivery information'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Payment information'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Language'),
                  const Divider(thickness: 1),
                  const ProfileItem(text: 'Privacy settings'),
                  const Divider(thickness: 1),
                  MaterialButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove(kEmail);

                      GoRouter.of(context).pushReplacement('/');
                    },
                    child: const Text(
                      'Logout',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
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

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          Text(
            text,
            style: styles.textStyle14,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
