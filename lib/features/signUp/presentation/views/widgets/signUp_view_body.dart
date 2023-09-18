import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/core/utils/functions/awesome_dialouge.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
        } else if (state is AuthFailure) {
          isLoading = false;
          ShowAwesomeDialouge(
              context: context,
              body: state.erroHeader,
              desctiption: state.errorMessage);
        } else if (state is AuthLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                key: _formKey,
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
                    CustomTextFormField(
                      hint: 'John Doe',
                      controller: _controller,
                    ),
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
                    CustomTextFormField(
                      hint: 'Example@gmail.com',
                      controller: _controller2,
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
                      hint: '*************',
                      controller: _controller3,
                      isHidden: true,
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).signInwithEmail(
                            email: _controller2.text,
                            password: _controller3.text,
                            name: _controller.text,
                          );
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
          ),
        );
      },
    );
  }
}
