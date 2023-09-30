import 'package:flutter/material.dart';
import 'package:shopy/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.isHidden = false,
    this.controller,
    this.enabled = true,
  });
  final String hint;
  final bool enabled;
  final bool isHidden;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObsecured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        if (value!.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          return null;
        }
      },
      enabled: widget.enabled,
      controller: widget.controller,
      obscureText: (widget.isHidden && isObsecured) ? true : false,
      decoration: InputDecoration(
        suffixIcon: widget.isHidden
            ? GestureDetector(
                onTap: () {
                  isObsecured = !isObsecured;
                  setState(() {});
                },
                child: Icon(
                  isObsecured ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        hintText: widget.hint,
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
