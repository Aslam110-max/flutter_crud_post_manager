
import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/util/app_constants.dart';

ThemeData theme({Color color = const Color(0xFFF57C01)}) => ThemeData(
      fontFamily: AppConstants.fontFamily,
      primaryColor: color,
      scaffoldBackgroundColor:const Color(0xFF2B3849),
      cardColor: const Color(0xFF404A5B),
      disabledColor: const Color.fromARGB(255, 113, 114, 116),
    );
