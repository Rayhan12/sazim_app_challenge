
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/color_config.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingAnimationWidget.fallingDot(color: color?? AppColor.primaryDefault, size: 40));
  }
}


