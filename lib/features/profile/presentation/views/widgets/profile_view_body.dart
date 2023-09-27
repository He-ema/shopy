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
    return SingleChildScrollView(
      child: Padding(
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
            const SizedBox(
              height: 20,
            ),
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
              'Account Details',
              style: styles.textStyle14,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
