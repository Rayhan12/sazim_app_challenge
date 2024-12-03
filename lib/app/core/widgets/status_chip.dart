
import 'package:flutter/material.dart';

import '../theme/color_config.dart';
import '../theme/text_config.dart';


class StatusChip extends StatefulWidget {
  final String label;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  const StatusChip({super.key, required this.label, this.radius, this.backgroundColor, this.textStyle, this.padding});

  @override
  State<StatusChip> createState() => _StatusChipState();
}

class _StatusChipState extends State<StatusChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColor.neutralFields,
        borderRadius: widget.radius ?? BorderRadius.circular(25),
      ),
      child: Text(widget.label ,style: widget.textStyle ?? AppText().caption.copyWith(color: AppColor.primaryDefault)),
    );
  }
}
