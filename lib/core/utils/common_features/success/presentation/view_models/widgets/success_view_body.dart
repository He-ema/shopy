import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/app_router.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/core/utils/styles.dart';

class SuccessViewBody extends StatefulWidget {
  const SuccessViewBody({super.key, required this.email});
  final String email;
  @override
  State<SuccessViewBody> createState() => _SuccessViewBodyState();
}

class _SuccessViewBodyState extends State<SuccessViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context)
          .pushReplacement(AppRouter.homeRoute, extra: widget.email);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 150, child: Image.asset(AssetData.success)),
        const SizedBox(
          height: 13,
        ),
        const Text(
          'Email Created\n Successfully',
          textAlign: TextAlign.center,
          style: styles.textStyle18,
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          'You have successfully created your Email\n Welcome in our application ',
          style: styles.textStyle14,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
