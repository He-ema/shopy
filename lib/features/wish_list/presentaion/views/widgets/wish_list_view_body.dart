import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/wish_list/presentaion/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_item.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_other_body.dart';

class WishListViewBody extends StatefulWidget {
  const WishListViewBody({super.key});

  @override
  State<WishListViewBody> createState() => _WishListViewBodyState();
}

class _WishListViewBodyState extends State<WishListViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WishListCubit>(context).getWishListItems();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Wish List',
            style: styles.textStyle26,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey,
          ),
          WishListOtherBody(),
        ],
      ),
    );
  }
}
