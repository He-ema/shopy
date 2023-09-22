import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';

void ShowAwesomeDialouge(
    {required context,
    required String body,
    required String desctiption,
    @required DialogType? dialogType}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType ?? DialogType.info,
    title: body,
    desc: desctiption,
    btnOkOnPress: () {},
    btnOkColor: kPrimaryColor,
  ).show();
}
