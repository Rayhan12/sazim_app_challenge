import 'package:flutter/material.dart';

import '../theme/color_config.dart';
import '../theme/text_config.dart';

class TitleContent extends StatelessWidget {
  final String title;
  final String content;
  const TitleContent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppText().title1.copyWith(
                  color: AppColor.primaryDefault,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Text(
          content,
          style: AppText().body,
        ),
      ],
    );
  }
}
