import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/features/cart/presentaion/manager/cart_cubit/cart_cubit.dart';
import 'package:shopy/features/cart/presentaion/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: CartViewBody(),
    );
  }
}
