import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

Widget getTag(String title) {
  return Container(
    child: Container(
      margin: EdgeInsets.all(5),
      child: Text(
        title,
        style: appTheme().textTheme.bodyText1.copyWith(fontSize: 10, fontWeight: FontWeight.w900),
      ),
    ),
    decoration: BoxDecoration(
      color: AppColors.yellow,
      borderRadius: BorderRadius.all(Radius.circular(9)),
    ),
  );
}
