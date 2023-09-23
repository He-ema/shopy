import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/core/utils/functions/awesome_dialouge.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_app_bar.dart';
import 'package:shopy/core/widgets/custom_button.dart';
import 'package:shopy/core/widgets/custom_text_form_field.dart';

class EnterForgottenEmailBody extends StatefulWidget {
  const EnterForgottenEmailBody({super.key});

  @override
  State<EnterForgottenEmailBody> createState() =>
      _EnterForgottenEmailBodyState();
}

class _EnterForgottenEmailBodyState extends State<EnterForgottenEmailBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomAppBar(text: 'Enter Email'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Enter Your forgotten email to send verification code and check your inbox',
              style: styles.textStyle13,
            ),
            const Spacer(),
            const Text(
              'Email',
              textAlign: TextAlign.start,
              style: styles.textStyle14,
            ),
            const SizedBox(
              height: 9,
            ),
            Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: CustomTextFormField(
                controller: _controller,
                hint: 'Example@gmail.com',
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(
              text: 'Next',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  CollectionReference users = FirebaseFirestore.instance
                      .collection(kUsersCollectionReference);
                  var doc = users.doc(_controller.text);
                  await doc.get().then((doc) {
                    if (doc.exists) {
                    } else {
                      ShowAwesomeDialouge(
                          context: context,
                          body: "Email not exist",
                          desctiption:
                              'The Email You entered doesn\'t match any email',
                          dialogType: DialogType.error);
                    }
                  });
                  isLoading = false;
                  setState(() {});
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
