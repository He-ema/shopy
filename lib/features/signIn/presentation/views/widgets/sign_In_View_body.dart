import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_or_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/google_register.dart';
import 'doesnot_have_account.dart';
import 'forgot_password.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const CustomAppBar(text: 'Sign In'),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Please fill E-mail & password to login your Shopy application account.',
                style: styles.textStyle13,
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'E-mail',
                style: styles.textStyle14,
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextFormField(hint: 'Example@gmail.com'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password',
                style: styles.textStyle14,
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextFormField(
                hint: '*************',
                isHidden: true,
              ),
              const SizedBox(
                height: 35,
              ),
              const ForgotPassword(),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomOrWidget(),
              const SizedBox(
                height: 28,
              ),
              const GoogleLogin(),
              const SizedBox(
                height: 28,
              ),
              const DoesnotHavaAccount(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
