
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomToast({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF334257),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding,
            margin: const EdgeInsets.only(
              right: Dimensions.paddingSizeLarge,
              left: Dimensions.paddingSizeLarge,
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                  isError
                      ? text == 'Internal Server Error' || text == 'Not Found'
                          ? Icons.check_circle
                          : CupertinoIcons.multiply_circle_fill
                      : Icons.check_circle,
                  color: isError
                      ? text == 'Internal Server Error' || text == 'Not Found'
                          ? const Color(0xff039D55)
                          : const Color(0xffFF9090).withOpacity(0.5)
                      : const Color(0xff039D55),
                  size: 20),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Flexible(
                  child: Text(
                      text == 'Internal Server Error' || text == 'Not Found'
                          ? 'Please wait..'
                          : text,
                      style: robotoRegular.copyWith(color: textColor),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
            ]),
          ),
        ),
      ),
    );
  }
}
