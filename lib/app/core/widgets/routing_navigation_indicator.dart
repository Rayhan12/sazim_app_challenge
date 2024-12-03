import 'package:flutter/cupertino.dart';
import 'package:sazim_app/app/core/widgets/buttons/routing_button.dart';

class RoutingNavigationIndicator extends StatelessWidget {
  final RoutingType? leftRoutingType;
  final RoutingType? rightRoutingType;
  final Function? leftOnClick;
  final Function? rightOnClick;
  const RoutingNavigationIndicator({super.key, this.leftRoutingType, this.rightRoutingType, this.leftOnClick, this.rightOnClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(leftRoutingType != null)
          RoutingButton(routingType: leftRoutingType!, onClick: leftOnClick ?? (){}),
        if(leftRoutingType == null)
          Container(),
        if(rightRoutingType != null)
          RoutingButton(routingType: rightRoutingType!, onClick: rightOnClick ?? (){}),
        if(rightRoutingType == null)
          Container(),
      ],
    );
  }
}
