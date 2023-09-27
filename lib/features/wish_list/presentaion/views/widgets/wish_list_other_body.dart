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

class WishListOtherBody extends StatefulWidget {
  const WishListOtherBody({
    super.key,
    required this.isLoading,
  });
  final VoidCallback isLoading;
  @override
  State<WishListOtherBody> createState() => _WishListOtherBodyState();
}

class _WishListOtherBodyState extends State<WishListOtherBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  CollectionReference favourites =
      FirebaseFirestore.instance.collection(kFavouriteCollectionReference);
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
                    child: AnimatedList(
                      key: _listKey,
                      padding: EdgeInsets.zero,
                      initialItemCount: state.items.length,
                      itemBuilder: (context, index, animation) {
                        void callDelete() async {
                          await deleteListItem(index, context, state);
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Slidable(
                            startActionPane:
                                ActionPane(motion: BehindMotion(), children: [
                              SlidableAction(
                                label: 'Delete',
                                onPressed: (context) async {
                                  await deleteListItem(index, context, state);
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ]),
                            child: WishListItem(
                              deleteItem: callDelete,
                              wishListItemModel: state.items[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    text: 'Add to cart',
                    onPressed: () async {
                      for (int i = 0; i < state.items.length; i++) {
                        CollectionReference cart = FirebaseFirestore.instance
                            .collection(kCartCollectionReference);
                        await cart.doc(state.items[i].id.toString()).set({
                          kId: state.items[i].id,
                          kImage: state.items[i].image,
                          kName: state.items[i].name,
                          kPrice: state.items[i].price,
                          kQuantity: state.items[i].quantity,
                        });
                      }
                      removeAllFromList();
                      // widget.isLoading();
                      for (int i = 0; i < state.items.length; i++) {
                        favourites.doc(state.items[i].id.toString()).delete();
                      }
                      // widget.isLoading();
                      Future.delayed(Duration(seconds: 2), () {
                        BlocProvider.of<WishListCubit>(context)
                            .getWishListItems();
                      });
                    },
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

  void removeAllFromList() {
    _listKey.currentState!.removeAllItems(
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
              Tween(begin: Offset(2, 0.0), end: Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.elasticInOut))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text(
                'Added to cart',
                style: styles.textStyle16.copyWith(color: Colors.white),
              )),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 2000),
    );
  }

  Future<void> deleteListItem(
      int index, BuildContext context, WishListSuccess state) async {
    {
      _listKey.currentState!.removeItem(
        index,
        (_, animation) {
          return SlideTransition(
            position: animation.drive(
                Tween(begin: Offset(2, 0.0), end: Offset(0.0, 0.0))
                    .chain(CurveTween(curve: Curves.elasticInOut))),
            // sizeFactor: animation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text('Deleted')),
              ),
            ),
          );
        },
        duration: Duration(milliseconds: 2000),
      );
      await favourites.doc(state.items[index].id.toString()).delete();
    }
  }
}
