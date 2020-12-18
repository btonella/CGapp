import 'package:CulturaGame/common/theme.dart';
import 'package:CulturaGame/utils/constants.dart';
import 'package:flutter/material.dart';

Widget getTag(String title, {bool hasTopMargin = true}) {
  return Container(
    child: Container(
      margin: hasTopMargin ? EdgeInsets.all(5) : EdgeInsets.only(top: 5, bottom: 5, right: 5),
      child: Text(
        title.toUpperCase(),
        style: appTheme().textTheme.bodyText1.copyWith(
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
      ),
    ),
    decoration: BoxDecoration(
      color: AppColors.yellow,
      borderRadius: BorderRadius.all(Radius.circular(9)),
    ),
  );
}
