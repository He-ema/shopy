import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';
import 'package:shopy/features/cart/presentaion/manager/cart_cubit/cart_cubit.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/shimmer_wish_list_body.dart';
import 'package:shopy/features/wish_list/presentaion/views/widgets/wish_list_item.dart';

class CartOtherBody extends StatefulWidget {
  const CartOtherBody({
    super.key,
    required this.isLoading,
  });
  final VoidCallback isLoading;
  @override
  State<CartOtherBody> createState() => _CartOtherBodyState();
}

class _CartOtherBodyState extends State<CartOtherBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  CollectionReference Cart =
      FirebaseFirestore.instance.collection(kCartCollectionReference);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is CartSuccess) {
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
                            startActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    label: 'Delete',
                                    onPressed: (context) async {
                                      await deleteListItem(
                                          index, context, state);
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
                    text: 'Checkout',
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your Cart is empty',
                  style: styles.textStyle26,
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ));
          }
        } else {
          return const Expanded(child: ShimmerWishListBody());
        }
      },
    );
  }

  Future<void> deleteListItem(
      int index, BuildContext context, CartSuccess state) async {
    {
      _listKey.currentState!.removeItem(
        index,
        (_, animation) {
          return SlideTransition(
            position: animation.drive(
                Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                    .chain(CurveTween(curve: Curves.elasticInOut))),
            // sizeFactor: animation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(child: Text('Deleted')),
              ),
            ),
          );
        },
        duration: const Duration(milliseconds: 2000),
      );
      await Cart.doc(state.items[index].id.toString()).delete();
    }
  }
}
