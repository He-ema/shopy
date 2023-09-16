import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void ShowAwesomeDialouge(
    {required context, required String body, required String desctiption}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    title: body,
    desc: desctiption,
    btnOkOnPress: () {},
  ).show();
}
