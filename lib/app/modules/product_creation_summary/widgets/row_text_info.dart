import 'package:flutter/cupertino.dart';

import '../../../core/theme/text_config.dart';

class RowTextInfo extends StatelessWidget {
  final String title;
  final String information;
  const RowTextInfo({super.key, required this.title, required this.information});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:", style: AppText().subHeadline,),
        Text(information, style: AppText().subHeadlineSemiBold,)
      ],
    );
  }
}
