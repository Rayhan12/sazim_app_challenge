import 'package:flutter/material.dart';

import '../../constant/constant_config.dart';
import '../../theme/color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';


class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final String? suffixText;
  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needTitle;
  final TextAlign? textAlign;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final Key? itemKey;
  final Function? onValueChange;
  final TextStyle? titleStyle;
  final Widget? prefixWidget;
  final IconData? prefixIcon;

  final FormFieldValidator<String>? validatorClass;

  const SimpleInputField(
      {super.key,
      this.onValueChange,
      required this.controller,
      required this.hintText,
      required this.errorMessage,
      this.textInputAction,
      this.inputType,
      this.suffixText,
      this.backgroundColor,
      this.viewOnly,
      required this.fieldTitle,
      this.validatorClass,
      this.needTitle,
      this.textAlign,
      this.prefixIcon,
      this.itemKey,
      this.borderRadius,
      this.hintTextStyle,
      this.inputTextStyle,
      this.titleStyle, this.prefixWidget});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          key: widget.itemKey,
          controller: widget.controller,
          keyboardType: widget.inputType ?? TextInputType.text,
          style: widget.inputTextStyle ?? AppText().body,
          textAlign: widget.textAlign ?? TextAlign.start,
          readOnly: widget.viewOnly ?? false,
          enabled: widget.viewOnly != null?  !widget.viewOnly! : true,
          // maxLength: null,
          decoration: InputDecoration(
            // counter:Text(""),
            errorStyle: AppText().callOut.copyWith(fontSize: 11, color: AppColor.semanticsError),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            label: FocusScope.of(context).focusedChild != null
                ? RichText(
                text: TextSpan(
                    children:
                    [
                      TextSpan(text:widget.fieldTitle,style: AppText().body.copyWith(color: AppColor.textPrimary)),
                      if(widget.validatorClass != null)
                      TextSpan(text:"*",style: AppText().body.copyWith(color: AppColor.semanticsError)),
                    ]
                )) : null,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle ?? AppText().body.copyWith(color: AppColor.textTertiary),
            filled: true,
            fillColor: widget.backgroundColor ?? AppColor.textWhite,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
            prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
            border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.neutralStroke)),
            focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.primaryDefault)),
            enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.neutralStroke)),
            errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.semanticsError))
          ),
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (value) {
            widget.controller.text = value;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
          validator: widget.validatorClass ?? Validator().noValidationRequired,
          onChanged: (value) {
            if (value.isNotEmpty && widget.onValueChange != null) {
              widget.onValueChange!(value);
            }
          },
        ),
      ],
    );
  }
}
