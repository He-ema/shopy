import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy/core/utils/app_router.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/core/utils/functions/awesome_dialouge.dart';
import 'package:shopy/core/utils/styles.dart';

import '../../../../../constants.dart';
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

  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthSuccess) {
          isLoading = false;
          if (BlocProvider.of<AuthCubit>(context).signedWithGoogle) {
            GoRouter.of(context).push(AppRouter.homeRoute,
                extra: BlocProvider.of<AuthCubit>(context).email);
          } else {
            if (BlocProvider.of<AuthCubit>(context).verified) {
              GoRouter.of(context).pushReplacement(AppRouter.homeRoute);
            } else {
              GoRouter.of(context).push(AppRouter.OTPRoute,
                  extra: BlocProvider.of<AuthCubit>(context).email);
            }
          }
        } else if (state is AuthFailure) {
          isLoading = false;
          ShowAwesomeDialouge(
              context: context,
              body: state.erroHeader,
              desctiption: state.errorMessage,
              dialogType: DialogType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
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
                    CustomAppBar(
                        text: 'Sign In',
                        onPressed: () {
                          GoRouter.of(context).pushReplacement('/');
                        }),
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
                    CustomTextFormField(
                      hint: 'Example@gmail.com',
                      controller: _controller,
                    ),
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
                    CustomTextFormField(
                      controller: _controller2,
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<AuthCubit>(context)
                              .loginWithEmailAndPassword(
                                  email: _controller.text,
                                  password: _controller2.text);
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
                    GoogleLogin(
                      onTap: () async {
                        await BlocProvider.of<AuthCubit>(context)
                            .signInWithGoogle();
                      },
                    ),
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
          ),
        );
      },
    );
  }
}
