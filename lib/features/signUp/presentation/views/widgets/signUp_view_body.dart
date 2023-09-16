import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_or_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/google_register.dart';
import 'already_have_an_account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
              const CustomAppBar(text: 'Sign Up'),
              const SizedBox(
                height: 54,
              ),
              const Text(
                'Name',
                style: styles.textStyle14,
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextFormField(hint: 'John Doe'),
              const SizedBox(
                height: 20,
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
                height: 44,
              ),
              CustomButton(
                text: 'Sign Up',
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
              const AlreadyHavaAnAccount(),
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
