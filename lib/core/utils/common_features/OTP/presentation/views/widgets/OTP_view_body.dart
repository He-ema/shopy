import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/app_router.dart';
import 'package:shopy/core/utils/functions/awesome_dialouge.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/utils/common_features/OTP/presentation/views/widgets/OTP_item.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import '../../../../../../../constants.dart';
import '../../../../../../widgets/custom_app_bar.dart';
import 'package:email_otp/email_otp.dart';

import '../../../../../cubits/Auth_cubit/auth_cubit.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key, required this.email});
  final String email;
  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  EmailOTP myauth = EmailOTP();
  String OTPValue = '1234';
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
                controller: _controller,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(0, 1, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller2,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(1, 2, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller3,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(2, 3, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller4,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(3, 4, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            text: 'Send Another Code',
            onPressed: () async {
              myauth.sendOTP();
              ShowAwesomeDialouge(
                  context: context,
                  body: 'Code Sent',
                  desctiption: 'Code sent to your Email check your inbox',
                  dialogType: DialogType.success);
            },
          )
        ],
      ),
    );
  }

  Future<void> verify() async {
    if (_controller.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _controller4.text != '') {
      if (await myauth.verifyOTP(otp: OTPValue) == true) {
        final CollectionReference _users =
            FirebaseFirestore.instance.collection(kUsersCollectionReference);
        _users.doc(widget.email).update({kVerified: true});
        GoRouter.of(context).push(AppRouter.successRoute, extra: widget.email);
      } else {
        _controller.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
        isFalse = true;
        setState(() {});
      }
    }
  }
}
