import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopy/core/utils/views/widgets/OTP_view_body.dart';

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
