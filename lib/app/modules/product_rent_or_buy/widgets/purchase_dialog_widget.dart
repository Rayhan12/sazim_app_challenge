import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';

class PurchaseDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;
  final Function onCancel;

  const PurchaseDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppText().headLine,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              message,
              style: AppText().subHeadline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ()=> onCancel(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.textDisabled,
                    foregroundColor: AppColor.textPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("No",style: AppText().subHeadlineMedium,),
                ),
                ElevatedButton(
                  onPressed: ()=>onConfirm(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryDefault,
                    foregroundColor: AppColor.textWhite,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Yes",style: AppText().subHeadlineMedium.copyWith(color: AppColor.textWhite),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showPurchaseDialog({
  required String title,
  required String message,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) {
  Get.dialog(
    PurchaseDialog(
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    ),
    barrierDismissible: false,
  );
}
