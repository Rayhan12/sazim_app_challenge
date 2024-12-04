// ignore_for_file: file_names
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import '../../constant/constant_config.dart';
import '../../theme/color_config.dart';
import '../../theme/text_config.dart';

class MultiSelectDropDownInputField extends StatefulWidget {
  final MultiSelectController<String> controller;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final String? suffixText;
  final Color? backgroundColor;
  final bool? needTitle;
  final bool? setInitialValue;
  final TextStyle? titleStyle;
  final bool? needSearch;
  final bool? viewOnly;
  final String? initialValue;
  final List<String>? items;
  final List<DropdownItem<String>>? itemBuilder;
  final Function? onValueChange;
  final Key? itemkey;
  final Widget? prefixWidget;
  final IconData? prefixIcon;

  ///Common Error factor
  /// 1=> If item list contains duplicate values

  const MultiSelectDropDownInputField({super.key, required this.controller, required this.hintText, required this.needValidation, required this.errorMessage, this.textInputAction, this.suffixText, this.backgroundColor, required this.fieldTitle, this.needTitle, this.items, this.setInitialValue, this.itemkey, this.onValueChange, this.itemBuilder, this.needSearch, this.viewOnly, this.titleStyle, this.initialValue, this.borderRadius, this.prefixWidget, this.prefixIcon});

  @override
  State<MultiSelectDropDownInputField> createState() => _MultiSelectDropDownInputFieldState();
}

class _MultiSelectDropDownInputFieldState extends State<MultiSelectDropDownInputField> {
  List<DropdownItem<String>> activeItemList = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    if (widget.items != null || widget.itemBuilder != null) {
      try {
        if (widget.items != null && widget.itemBuilder == null) {
          activeItemList = widget.items!
              .map((e) => DropdownItem<String>(
                    value: e.toString(),
                    label: e,
                  ))
              .toList();
        } else if ((widget.items == null && widget.itemBuilder != null)) {
          activeItemList = widget.itemBuilder!;
        } else {
          activeItemList = [];
        }
      } catch (error) {
        throw Exception("Please check if selection item list has been provided or not");
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiDropdown<String>(
          controller: widget.controller,
          enabled: true,
          searchEnabled: true,
          chipDecoration: ChipDecoration(
            backgroundColor: AppColor.primaryDefault,
            labelStyle: AppText().callOut.copyWith(color: AppColor.textWhite),
            wrap: true,
            runSpacing: 2,
            spacing: 10,
          ),
          items: widget.items != null
              ? activeItemList = widget.items!
                  .map(
                    (e) => DropdownItem<String>(
                      label: e,
                      value: e,
                      selected:widget.controller.selectedItems.isNotEmpty?  widget.controller.selectedItems.map((e) => e.value,).contains(e): false
                    ),
                  ).toList()
              : widget.itemBuilder != null || widget.itemBuilder!.isEmpty
                  ? widget.itemBuilder!
                  : <DropdownItem<String>>[],
          fieldDecoration: FieldDecoration(
            hintText: widget.hintText,
            hintStyle: AppText().body.copyWith(color: AppColor.textTertiary),
            backgroundColor: widget.backgroundColor ?? AppColor.textWhite,
            prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
            suffixIcon: null,
            border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
            focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.primaryDefault)),
            disabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
            errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.semanticsError)),
          ),

          dropdownItemDecoration: const DropdownItemDecoration(
            selectedIcon: Icon(Icons.check_box, color: AppColor.primaryDefault),
            disabledIcon: Icon(Icons.lock, color: AppColor.textDisabled),
          ),

          // onSelectionChange: (selectedItems) {
          //   debugPrint("OnSelectionChange: $selectedItems");
          //   print(widget.controller.selectedItems);
          // },

          validator: (value) {
            if (!widget.needValidation) return null;
            if (value == null || value.toString().isEmpty || value.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}
