import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/features/profile/data/user_model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getUserData(String email) async {
    emit(ProfileLoading());
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(kUsersCollectionReference);
      var data = await users.doc(email).get();
      emit(ProfileSuccess(UserModel.fromJson(data)));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}
