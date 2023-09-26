import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/features/wish_list/presentaion/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/shimmer_wish_list_body.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_item.dart';

class WishListOtherBody extends StatelessWidget {
  const WishListOtherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        if (state is WishListFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is WishListSuccess) {
          if (state.items.length != 0) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.items.length,
                itemBuilder: (context, index) => WishListItem(
                  wishListItemModel: state.items[index],
                  onPressed: (context) {},
                ),
              ),
            );
          } else {
            return Lottie.asset('assets/lotties/empty2.json');
          }
        } else {
          return Expanded(child: ShimmerWishListBody());
        }
      },
    );
  }
}
