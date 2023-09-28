import 'package:flutter/material.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/utils/styles.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(AssetData.test)),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Hampksha',
                              style: styles.textStyle18,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              color: Colors.grey,
                              onPressed: () {},
                              child: Text('Edit Profile'),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Account Details',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Card & offers',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Notifications',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Delivery information',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Payment information',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Language',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Privacy settings',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Logout',
                      style: styles.textStyle14,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
