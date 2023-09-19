import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';

class OTPField extends StatelessWidget {
  const OTPField(
      {super.key,
      required this.onSaved,
      required this.onChanged,
      this.controller,
      this.isFalse});
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? isFalse;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        autofocus: true,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF7F8F9),
          counterText: '',
          border: BuildOTPBorder(),
          enabledBorder: BuildOTPBorder(isFalse! ? Colors.red : Colors.grey),
          focusedBorder: BuildOTPBorder(kPrimaryColor),
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  OutlineInputBorder BuildOTPBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: color ?? Colors.grey));
  }
}
