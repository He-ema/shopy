import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';

import '../../../../wish_list/data/wish_list_item_model/wish_list_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCartItems() async {
    emit(CartLoading());

    try {
      CollectionReference favourites =
          FirebaseFirestore.instance.collection(kCartCollectionReference);

      var listData = await favourites.orderBy(kId).get();
      List<WishListItemModel> items = [];
      for (var element in listData.docs) {
        items.add(WishListItemModel.fromJson(element));
      }
      emit(CartSuccess(items));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
