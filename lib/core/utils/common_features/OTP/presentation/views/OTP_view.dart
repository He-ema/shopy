import 'package:flutter/material.dart';
import 'package:shopy/core/utils/common_features/OTP/presentation/views/widgets/OTP_view_body.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OTPViewBody(
        email: email,
      ),
    );
  }
}
