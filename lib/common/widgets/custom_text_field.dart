import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';

class CustomTextField extends StatelessWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool showTitle;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.titleText = 'Enter Title',
    this.hintText = '',
    this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.showTitle = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        if (showTitle)
          Text(titleText,
              style:
                  robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
        if (showTitle) const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          validator: validator,
          style: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeDefault, color: Colors.white),
          textInputAction: inputAction,
          keyboardType: inputType,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  width: 0.3, color: Theme.of(context).disabledColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide:
                  BorderSide(width: 1, color: Theme.of(context).primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide:
                  BorderSide(width: 0.3, color: Theme.of(context).primaryColor),
            ),
            isDense: true,
            hintText: hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Theme.of(context).hintColor),
            filled: true,
          ),
        ),
      ],
    );
  }
}
