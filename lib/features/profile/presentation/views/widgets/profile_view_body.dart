import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/assetData.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:shopy/features/profile/presentation/views/widgets/profile_shimmer.dart';
import 'package:shopy/features/profile/presentation/views/widgets/success_body.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.email});
  final String email;
  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUserData(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return SuccessBody(user: state.user);
        } else if (state is ProfileFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const ProfileShimmer();
        }
      },
    );
  }
}
