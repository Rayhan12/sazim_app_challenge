import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';


abstract class RoutingType{
  String getName();
  IconData getIconData();
  IconAlignment getIconAlignment();
}

class NextRoutingStrategy implements RoutingType{
  @override
  String getName() => "Next";

  @override
  IconData getIconData() => RIcon.Arrow_Right;

  @override
  IconAlignment getIconAlignment() => IconAlignment.end;
}

class PreviousRoutingStrategy implements RoutingType{
  @override
  String getName() => "Previous";

  @override
  IconData getIconData() => RIcon.Arrow_Left;

  @override
  IconAlignment getIconAlignment() => IconAlignment.start;
}

class SubmitRoutingStrategy implements RoutingType{
  @override
  String getName() => "Submit";

  @override
  IconData getIconData() => RIcon.Check_Circle;

  @override
  IconAlignment getIconAlignment() => IconAlignment.end;
}

class PurchaseRoutingStrategy implements RoutingType{
  @override
  String getName() => "Purchase";

  @override
  IconData getIconData() => RIcon.Tag_Price;

  @override
  IconAlignment getIconAlignment() => IconAlignment.end;
}

class RentRoutingStrategy implements RoutingType{
  @override
  String getName() => "Rent";

  @override
  IconData getIconData() => RIcon.Wallet_Money;

  @override
  IconAlignment getIconAlignment() => IconAlignment.end;
}


class RoutingButton extends StatelessWidget {
  final RoutingType routingType;
  final Function onClick;

  const RoutingButton(
      {super.key, required this.routingType, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(routingType.getName(),
          style: AppText().subHeadlineSemiBold.copyWith(
              color: AppColor.textWhite)),
      icon: Icon(routingType.getIconData(),color: AppColor.textWhite,),
      iconAlignment: routingType.getIconAlignment(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryDefault,
        elevation: 0,
        splashFactory: InkSplash.splashFactory,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      onPressed: () => onClick(),
    );
  }
}
