import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_or_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/google_register.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(text: 'Sign Up'),
          Expanded(
            child: SizedBox(
              height: 54,
            ),
          ),
          Text(
            'Name',
            style: styles.textStyle14,
          ),
          SizedBox(
            height: 9,
          ),
          CustomTextFormField(hint: 'John Doe'),
          SizedBox(
            height: 20,
          ),
          Text(
            'E-mail',
            style: styles.textStyle14,
          ),
          SizedBox(
            height: 9,
          ),
          CustomTextFormField(hint: 'Example@gmail.com'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Password',
            style: styles.textStyle14,
          ),
          SizedBox(
            height: 9,
          ),
          CustomTextFormField(hint: '*************'),
          Expanded(
            child: SizedBox(
              height: 44,
            ),
          ),
          CustomButton(
            text: 'Sign Up',
            onPressed: () {},
          ),
          SizedBox(
            height: 50,
          ),
          CustomOrWidget(),
          SizedBox(
            height: 28,
          ),
          GoogleLogin(),
          SizedBox(
            height: 50,
          ),
          AlreadyHavaAnAccount(),
          Expanded(
            child: SizedBox(
              height: 42,
            ),
          ),
        ],
      ),
    );
  }
}

class AlreadyHavaAnAccount extends StatelessWidget {
  const AlreadyHavaAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account ? '),
        GestureDetector(onTap: () {}, child: Text('Sign In')),
      ],
    );
  }
}
