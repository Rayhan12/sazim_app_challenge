import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/custom_controllers/date_time_controller.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/core/widgets/input_widgets/dateTime_input_field.dart';
import 'package:sazim_app/app/modules/product_rent_or_buy/controllers/product_rent_or_buy_controller.dart';

class RentDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;
  final Function onCancel;
  final DateTimeController startDateController;
  final DateTimeController endDateController;
  final TextEditingController startTextController;
  final TextEditingController endTextController;
  final GlobalKey<FormState> formKey;

  const RentDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    required this.startDateController,
    required this.endDateController,
    required this.startTextController,
    required this.endTextController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductRentOrBuyController>();
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
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  DateTimeInputField(
                    controller: startTextController,
                    hintText: "Start Date",
                    needValidation: true,
                    errorMessage: "Please select a date",
                    dateTimeController: startDateController,
                    fieldTitle: "Start Date",
                    prefixIcon: RIcon.Calendar_Date,
                  ),
                  const SizedBox(height: 10,),
                  DateTimeInputField(
                    controller: endTextController,
                    hintText: "End Date",
                    needValidation: true,
                    errorMessage: "Please select a date",
                    dateTimeController: endDateController,
                    fieldTitle: "End Date",
                    prefixIcon: RIcon.Calendar_Date,
                  ),
                  const SizedBox(height: 10,),
                  Obx(() {
                    return controller.showDateSelectionError.value?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Please select valid dates",style: AppText().subHeadline.copyWith(color: AppColor.semanticsError),),
                        const SizedBox(height: 10,),
                      ],
                    ): Container();
                  },),


                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onCancel(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.textDisabled,
                    foregroundColor: AppColor.textPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "No",
                    style: AppText().subHeadlineMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onConfirm(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryDefault,
                    foregroundColor: AppColor.textWhite,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Yes",
                    style: AppText().subHeadlineMedium.copyWith(color: AppColor.textWhite),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showRentDialog({
  required String title,
  required String message,
  required DateTimeController startDateController,
  required DateTimeController endDateController,
  required TextEditingController startTextController,
  required TextEditingController endTextController,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
  required GlobalKey<FormState> formKey,
}) {
  Get.dialog(
    RentDialog(
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
      endDateController: endDateController,
      startDateController: startDateController,
      endTextController: endTextController,
      startTextController: startTextController,
      formKey: formKey,
    ),
    barrierDismissible: false,
  );
}
