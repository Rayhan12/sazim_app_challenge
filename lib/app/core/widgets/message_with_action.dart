import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';

class MessageWithAction extends StatelessWidget {
  final String message;
  final String buttonText;
  final Function onClick;

  const MessageWithAction(
      {super.key,
      required this.message,
      required this.buttonText,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppText().body,
        ),
        TextButton(
          onPressed: () => onClick(),
          child: Text(buttonText,style: AppText().bodyMedium.copyWith(color: AppColor.primaryDefault),),
        ),
      ],
    );
  }
}
