import 'package:flutter/material.dart';

import '../../../core/theme/color_config.dart';
import '../../../core/theme/text_config.dart';

class TitleInfo extends StatelessWidget {
  final String title;
  final String information;

  const TitleInfo({super.key, required this.title, required this.information});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.neutralFields,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,style: AppText().caption,),
              ],
            ),
            Text(information, style: AppText().body,)
          ],
        ),
      ),
    );
  }
}
