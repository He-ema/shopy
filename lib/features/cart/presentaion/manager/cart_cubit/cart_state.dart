part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<WishListItemModel> items;
  final double total;
  const CartSuccess(this.items, this.total);
}

final class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure(this.errorMessage);
}
