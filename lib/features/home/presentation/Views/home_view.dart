import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopy/features/home/presentation/Views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
