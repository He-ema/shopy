import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/utils/views/widgets/OTP_item.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import '../../../widgets/custom_app_bar.dart';
import 'package:email_otp/email_otp.dart';

import '../../cubits/Auth_cubit/auth_cubit.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key, required this.email});
  final String email;
  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  EmailOTP myauth = EmailOTP();
  bool isFalse = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myauth.setConfig(
        appEmail: "Food@gmail.com",
        appName: "Food",
        userEmail: widget.email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    myauth.sendOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomAppBar(text: 'Verification'),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Code sent to your email address , Please check your inbox to  verify your Email.',
            style: styles.textStyle13,
          ),
          const SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPField(
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              OTPField(
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              OTPField(
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              OTPField(
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            text: 'Send Another Code',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
