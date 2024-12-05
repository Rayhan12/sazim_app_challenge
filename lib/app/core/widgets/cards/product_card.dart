import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,top: 5),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1,color: AppColor.textTertiary.withOpacity(0.3))
        ),
        color: AppColor.neutralsBg,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.title.toString(),
                style: AppText().headLine,
              ),
              const SizedBox(height: 5,),
              Text(
                "Categories: ${productEntity.categories!.map((e) => e,).toString().replaceAll("(", "").replaceAll(")", "")} ",
                style: AppText().subHeadlineSemiBold.copyWith(color: AppColor.textTertiary),
              ),
              const SizedBox(height: 2,),
              Text(
                "Price: \$${productEntity.purchasePrice.toString()} | Rent: \$${productEntity.rentPrice.toString()} ${productEntity.rentOption.toString()}",
                style: AppText().subHeadlineSemiBold.copyWith(color: AppColor.textTertiary),
              ),

              const SizedBox(height: 8,),
              Text(
                productEntity.description.toString(),
                style: AppText().subHeadline.copyWith(color: AppColor.textPrimary),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
