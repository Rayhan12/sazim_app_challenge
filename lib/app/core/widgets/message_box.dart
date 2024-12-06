
import 'package:flutter/cupertino.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';

class MessageBox extends StatelessWidget {
  final String? message;
  const MessageBox({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
        child: Text(message?? "Please try again later" ,style: AppText().subHeadline ,textAlign: TextAlign.center),
      ),
    );
  }
}
