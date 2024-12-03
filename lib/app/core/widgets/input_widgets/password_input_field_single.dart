// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constant/constant_config.dart';
import '../../theme/color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';



class PasswordInputFieldSingle extends StatefulWidget {
  final TextEditingController password;
  final String fieldTitle;
  final String hintText;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  const PasswordInputFieldSingle({
    super.key,
    required this.password,
    this.prefixIcon,
    required this.fieldTitle,
    required this.hintText,
    this.textInputAction,
    this.backgroundColor,
    this.borderRadius,
    this.prefixWidget,
  });

  @override
  State<PasswordInputFieldSingle> createState() => _PasswordInputFieldSingleState();
}

class _PasswordInputFieldSingleState extends State<PasswordInputFieldSingle> {
  bool hidePassword = true;
  bool hasSomePassword = false;

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
          autofocus: false,
          obscureText: hidePassword,
          controller: widget.password,
          style: AppText().body,
          onSaved: (value) {
            widget.password.text = value!;
          },
          onChanged: (value) {
            if (widget.password.text.isNotEmpty) {
              setState(() {
                hasSomePassword = true;
              });
            } else {
              setState(() {
                hasSomePassword = false;
              });
            }
          },
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          validator: Validator().validatePassword,
          decoration: InputDecoration(
            focusColor: AppColor.primaryDefault,
            filled: true,
            fillColor: widget.backgroundColor ?? AppColor.textWhite,
            errorStyle: AppText().callOut.copyWith(fontSize: 11, color: AppColor.semanticsError),
              prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
            suffixIcon: hasSomePassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: hidePassword? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            label: FocusScope.of(context).focusedChild != null
              ? RichText(
              text: TextSpan(
                  children:
                  [
                    TextSpan(text:widget.fieldTitle,style: AppText().body.copyWith(color: AppColor.textPrimary)),
                    TextSpan(text:"*",style: AppText().body.copyWith(color: AppColor.semanticsError)),
                  ]
              ),):null,
            hintText: widget.hintText,
            hintStyle: AppText().body.copyWith(color: AppColor.textTertiary),
              focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.primaryDefault)),
              enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.neutralStroke)),
              errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth,color: AppColor.semanticsError))
          ),
        ),
      ],
    );
  }
}
