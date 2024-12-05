import 'package:flutter/material.dart';

import '../theme/color_config.dart';
import '../theme/text_config.dart';

class RowText extends StatelessWidget {
  final String title;
  final String content;
  const RowText({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title: $content",
      style: AppText().subHeadlineSemiBold.copyWith(color: AppColor.textTertiary),
    );
  }
}
