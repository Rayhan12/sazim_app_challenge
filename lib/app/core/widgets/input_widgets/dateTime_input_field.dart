// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';

import '../../constant/constant_config.dart';
import '../../custom_controllers/date_time_controller.dart';
import '../../theme/color_config.dart';

class DateTimeInputField extends StatefulWidget {
  final TextEditingController controller;
  final DateTimeController dateTimeController;
  final String hintText;
  final String? suffixText;
  final bool needValidation;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final String fieldTitle;
  final bool? needTitle;
  final Widget? prefixWidget;
  final IconData? prefixIcon;

  const DateTimeInputField({super.key, required this.controller, required this.hintText, required this.needValidation, required this.errorMessage, this.textInputAction, required this.dateTimeController, this.backgroundColor, this.suffixText, required this.fieldTitle, this.needTitle, this.borderRadius, this.prefixWidget, this.prefixIcon});

  @override
  State<DateTimeInputField> createState() => _DateTimeInputFieldState();
}

class _DateTimeInputFieldState extends State<DateTimeInputField> {
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (widget.needTitle ?? true) Text(widget.fieldTitle, style: AppText().headLine),
        // if (widget.needTitle ?? true)
          TextFormField(
            controller: widget.controller,
            style: AppText().subHeadlineMedium,
            decoration: InputDecoration(
                errorStyle: AppText().caption.copyWith(fontSize: 11, color: AppColor.semanticsError),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                hintText: widget.hintText,
                hintStyle: AppText().subHeadline,
                label: Get.focusScope !=null && Get.focusScope!.hasFocus
                    ? RichText(
                    text: TextSpan(
                        children:
                        [
                          TextSpan(text:widget.fieldTitle,style: AppText().body.copyWith(color: AppColor.textPrimary)),
                          if(widget.needValidation)
                            TextSpan(text:"*",style: AppText().body.copyWith(color: AppColor.semanticsError)),
                        ]
                    )) : null,
                filled: true,
                fillColor: widget.backgroundColor ?? AppColor.textWhite,
                suffixIcon: null,
                suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
                prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
                border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
                focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.primaryDefault)),
                enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
                errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.semanticsError))),
            readOnly: true,
            onTap: () async {
              pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
                // currentTime: DateTime.now(),
                initialDate: DateTime.now(),
              );

              if (pickedDate != null) {
                widget.dateTimeController.inputDateTime(pickedDate!);
                String formattedDate = widget.dateTimeController.getDateMonthYear();
                setState(() {
                  widget.controller.text = formattedDate;
                });
              } else {
                setState(() {
                  widget.controller.text = widget.errorMessage;
                });
              }
            },
            validator: (value) {
              if (!widget.needValidation) return null;
              if (value == null || value.isEmpty) {
                return widget.errorMessage;
              }
              return null;
            },
          ),
      ],
    );
  }
}
