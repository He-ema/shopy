import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';

import '../../../data/wish_list_item_model/wish_list_item_model.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  Future<void> getWishListItems() async {
    emit(WishListLoading());

    try {
      CollectionReference favourites =
          FirebaseFirestore.instance.collection(kFavouriteCollectionReference);

      var listData = await favourites.get();
      List<WishListItemModel> items = [];
      for (var element in listData.docs) {
        items.add(WishListItemModel.fromJson(element));
      }
      emit(WishListSuccess(items));
    } catch (e) {
      emit(WishListFailure(e.toString()));
    }
  }
}
