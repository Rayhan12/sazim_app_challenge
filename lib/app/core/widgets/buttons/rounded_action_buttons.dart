import 'package:flutter/material.dart';

import '../../theme/color_config.dart';
import '../../theme/text_config.dart';


class RoundedActionButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? overlayColor;
  final EdgeInsets? padding;
  final EdgeInsets? outerPadding;
  final double? height;
  const RoundedActionButton({super.key, required this.onClick, required this.title, this.titleStyle, this.backgroundColor, this.padding, this.outerPadding, this.overlayColor, this.height});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: outerPadding?? EdgeInsets.zero,
      child: ElevatedButton(
          onPressed: (){onClick();},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          maximumSize: Size(size.width, height??50),
          minimumSize: Size(size.width, height??50),
          backgroundColor: backgroundColor ?? AppColor.primaryDefault,
          padding: padding,
          elevation: 0,
          overlayColor: overlayColor?? AppColor.neutralsBg
        ),
          child: Text(
            title,
            style: titleStyle ?? AppText().headLine.copyWith(color: AppColor.textWhite),
          ),
      ),
    );
  }
}
