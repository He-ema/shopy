import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopy/core/widgets/custom_button.dart';
import 'package:shopy/core/widgets/custom_text_form_field.dart';
import 'package:shopy/features/profile/data/user_model/user_model.dart';

import '../../../../../constants.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.userModel.name;
    _controller2.text = widget.userModel.email;
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: MediaQuery.of(context).size.width * 0.25,
              child: CachedNetworkImage(
                imageUrl: widget.userModel.image,
                placeholder: (context, url) => const SpinKitSpinningLines(
                  color: kPrimaryColor,
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(hint: 'Name', controller: _controller),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hint: 'Email',
              controller: _controller2,
              enabled: false,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'Save',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
