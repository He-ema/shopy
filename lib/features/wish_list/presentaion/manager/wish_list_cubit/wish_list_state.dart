part of 'wish_list_cubit.dart';

sealed class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

final class WishListInitial extends WishListState {}

final class WishListLoading extends WishListState {}

final class WishListFailure extends WishListState {
  final String errorMessage;

  const WishListFailure(this.errorMessage);
}

final class WishListSuccess extends WishListState {
  final List<WishListItemModel> items;

  const WishListSuccess(this.items);
}
