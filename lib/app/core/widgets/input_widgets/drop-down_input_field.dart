// ignore_for_file: file_names
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:sazim_app/app/core/constant/constant_config.dart';

import '../../theme/color_config.dart';
import '../../theme/text_config.dart';

class DropDownInputField extends StatefulWidget {
  final TextEditingController controller;
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
  final List<DropdownMenuItem>? itemBuilder;
  final Function? onValueChange;
  final Key? itemkey;
  final Widget? prefixWidget;
  final IconData? prefixIcon;

  ///Common Error factor
  /// 1=> If item list contains duplicate values

  const DropDownInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.needValidation,
      required this.errorMessage,
      this.textInputAction,
      this.suffixText,
      this.backgroundColor,
      required this.fieldTitle,
      this.needTitle,
      this.items,
      this.setInitialValue,
      this.itemkey,
      this.onValueChange,
      this.itemBuilder,
      this.needSearch,
      this.viewOnly,
      this.titleStyle,
      this.initialValue,
      this.borderRadius, this.prefixWidget, this.prefixIcon});

  @override
  State<DropDownInputField> createState() => _DropDownInputFieldState();
}

class _DropDownInputFieldState extends State<DropDownInputField> {
  List<DropdownMenuItem> activeItemList = [];
  final TextEditingController searchController = TextEditingController();
  bool isMenuOpen = false;

  @override
  void initState() {
    if (widget.items != null && widget.itemBuilder == null) {
      activeItemList = widget.items!.map((e) => DropdownMenuItem(value: e.toString(), child: Text(e, style: AppText().caption))).toList();
    } else if ((widget.items == null && widget.itemBuilder != null)) {
      activeItemList = widget.itemBuilder!;
    } else {
      activeItemList = [];
    }

    // if (widget.setInitialValue ?? false) {
    //   widget.controller.text = activeItemList[0].value.toString();
    // }

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField2(
          isExpanded: true,
          dropdownSearchData: (widget.needSearch ?? false)
              ? DropdownSearchData(
                  searchController: searchController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      readOnly: widget.viewOnly ?? false,
                      controller: searchController,
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                                TextSpan(text: widget.fieldTitle, style: AppText().body),
                                if (widget.needValidation) TextSpan(text: "*", style: AppText().body.copyWith(color: AppColor.semanticsError)),
                              ])),
                          hintText: "Search...",
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: 1, color: AppColor.neutralStroke)),
                          focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.primaryDefault)),
                          enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
                          errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.semanticsError))),
                    ),
                  ),
                )
              : null,
          key: widget.itemkey,
          items: widget.items != null
              ? activeItemList = widget.items!
                  .map((e) => DropdownMenuItem(
                      value: e.toString(),
                      child: Text(
                        e,
                        style: AppText().subHeadlineSemiBold,
                        // maxLines: isMenuOpen? 1 : null,
                        overflow: isMenuOpen ? null : TextOverflow.fade,
                      )))
                  .toList()
              : widget.itemBuilder != null || widget.itemBuilder!.isEmpty
                  ? widget.itemBuilder
                  : [],

          style: AppText().caption.copyWith(color: AppColor.primaryDefault),
          decoration: InputDecoration(
            errorStyle: AppText().caption.copyWith(fontSize: 11, color: AppColor.semanticsError),
            contentPadding: widget.controller.text.isNotEmpty ? const EdgeInsets.only(right: 15, left: 0, bottom: 15, top: 15) : const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 15),
            hintText: widget.hintText,
            hintStyle: AppText().body.copyWith(color: AppColor.textTertiary),
            filled: true,
            fillColor: widget.backgroundColor ?? AppColor.textWhite,
            prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
              border: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
              focusedBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.primaryDefault)),
              enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.neutralStroke)),
              errorBorder: OutlineInputBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(10), borderSide: const BorderSide(width: borderSideWidth, color: AppColor.semanticsError)),
          ),

          value: widget.initialValue ??
              (widget.controller.text.isNotEmpty
                  ? widget.controller.text
                  : (widget.setInitialValue ?? false) && activeItemList.isNotEmpty
                      ? activeItemList[0].value
                      : null),
          onChanged: (value) {
            widget.controller.text = value.toString();
            if (widget.onValueChange != null) {
              widget.onValueChange!();
            }
            searchController.clear();
          },
          onSaved: (value) {
            widget.controller.text = value!.toString();
            if (widget.onValueChange != null) {
              widget.onValueChange!();
            }
            searchController.clear();
          },
          menuItemStyleData: MenuItemStyleData(
            selectedMenuItemBuilder: (ctx, child) {
              return Container(
                color: AppColor.neutralsBg,
                child: child,
              );
            },
          ),
          onMenuStateChange: (value) {
            setState(() {
              isMenuOpen = value;
              print(value);
            });
          },
          validator: (value) {
            if (!widget.needValidation) return null;
            if (value == null || value.toString().isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}
