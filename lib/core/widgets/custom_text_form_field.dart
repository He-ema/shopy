import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
  });
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        hintText: hint,
        hintStyle: styles.textStyle14.copyWith(color: const Color(0xffD5DDE0)),
        focusedBorder: CreateBorder(),
        filled: true,
        fillColor: const Color(0xffF7F8F9),
        enabledBorder: CreateBorder(),
        border: CreateBorder(),
      ),
    );
  }

  OutlineInputBorder CreateBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(14),
    );
  }
}
