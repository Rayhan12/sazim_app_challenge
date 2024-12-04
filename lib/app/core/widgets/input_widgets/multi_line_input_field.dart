import 'package:flutter/material.dart';
import '../../constant/constant_config.dart';
import '../../theme/color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';

class MultiLineInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final String? suffixText;
  final int numberOfLines;
  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needTitle;
  final BorderRadius? borderRadius;
  final FormFieldValidator<String>? validatorClass;

  const MultiLineInputField(
      {Key? key, required this.controller, required this.hintText, this.suffixText, this.backgroundColor, this.viewOnly, required this.fieldTitle, this.validatorClass, this.needTitle, required this.numberOfLines, this.borderRadius})
      : super(key: key);

  @override
  State<MultiLineInputField> createState() => _MultiLineInputFieldState();
}

class _MultiLineInputFieldState extends State<MultiLineInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          style: AppText().body,
          readOnly: widget.viewOnly ?? false,
          maxLines: widget.numberOfLines,
          decoration: InputDecoration(
              errorStyle: AppText().callOut.copyWith(fontSize: 11, color: AppColor.semanticsError),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignLabelWithHint: true,
              label: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: widget.fieldTitle, style: AppText().body),
                    if (widget.validatorClass != null) TextSpan(text: "*", style: AppText().body.copyWith(color: AppColor.semanticsError)),
                  ])),
              hintText: widget.hintText,
              hintStyle: AppText().body.copyWith(color: AppColor.textTertiary),
              filled: true,
              fillColor: widget.backgroundColor ?? AppColor.textWhite,
              suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
              suffixIcon: null,
              border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
              focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.primaryDefault)),
              enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
              errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.semanticsError))),
          textInputAction: TextInputAction.newline,
          onFieldSubmitted: (value) {
            widget.controller.text = value;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
          validator: widget.validatorClass ?? Validator().noValidationRequired,
        ),
      ],
    );
  }
}