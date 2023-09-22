import 'package:flutter/material.dart';
import 'package:shopy/core/utils/common_features/success/presentation/view_models/widgets/success_view_body.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessViewBody(),
    );
  }
}
