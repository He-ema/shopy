import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/cart/presentaion/manager/cart_cubit/cart_cubit.dart';
import 'package:shopy/features/cart/presentaion/views/widgets/cart_other_body.dart';
import 'package:shopy/features/wish_list/presentaion/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_other_body.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CartCubit>(context).getCartItems();
  }

  bool isLoading = false;

  void changeLoading() {
    if (isLoading == true) {
      isLoading = false;
      setState(() {});
    } else {
      isLoading = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Wish List',
              style: styles.textStyle26,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
            ),
            CartOtherBody(isLoading: changeLoading),
          ],
        ),
      ),
    );
  }
}
