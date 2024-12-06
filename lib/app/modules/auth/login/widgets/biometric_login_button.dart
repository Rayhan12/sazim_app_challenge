import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/asset_config.dart';

import '../../../../core/theme/text_config.dart';

class BiometricLoginButton extends StatelessWidget {
  final Function onClick;
  const BiometricLoginButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: ()=> onClick(),
            child: SizedBox(
              height: 130,
              width: 130,
              child: Lottie.asset(AppAssets.biometricAnimation, fit: BoxFit.contain)
            ),
          ),
          Text("Biometric Login" , style: AppText().body,)
        ],
      ),
    );
  }
}
