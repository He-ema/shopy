import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';
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
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.items.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Slidable(
                          startActionPane:
                              ActionPane(motion: BehindMotion(), children: [
                            SlidableAction(
                              label: 'Delete',
                              onPressed: (context) {
                                CollectionReference favourites =
                                    FirebaseFirestore.instance.collection(
                                        kFavouriteCollectionReference);
                                favourites.doc(state.items[index].id).delete();
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ]),
                          child: WishListItem(
                            wishListItemModel: state.items[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Add to cart',
                    onPressed: () {},
                  ),
                ],
              ),
            );
          } else {
            return Expanded(
                child: Column(
              children: [
                Expanded(child: Lottie.asset('assets/lotties/empty2.json')),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your wish list is empty',
                  style: styles.textStyle26,
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ));
          }
        } else {
          return Expanded(child: ShimmerWishListBody());
        }
      },
    );
  }
}
