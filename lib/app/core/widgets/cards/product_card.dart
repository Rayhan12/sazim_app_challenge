import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

import '../row_text.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity productEntity;
  final Function? onDelete;

  const ProductCard({super.key, required this.productEntity, this.onDelete});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with TickerProviderStateMixin {
  late Timer timer;

  bool hasAnimatedToFullText = false;
  int maxLines = 2;

  void animation() {
    if (!hasAnimatedToFullText) {
      maxLines = 2000;
      timer = Timer(const Duration(seconds: 10), () => animation());
    } else {
      maxLines = 2;
    }
    setState(() {
      hasAnimatedToFullText = !hasAnimatedToFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 1, color: AppColor.textTertiary.withOpacity(0.3))),
        color: AppColor.neutralsBg,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.productEntity.title.toString(),
                      style: AppText().headLine,
                    ),
                  ),
                  if(widget.onDelete != null)
                  IconButton(
                    onPressed: (){
                      widget.onDelete!();
                      setState(() {});
                    },
                    icon: const Icon(RIcon.Trash_Bin_Minimalistic),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              RowText(
                title: "Categories",
                content: widget.productEntity.categoriesValues!
                    .map(
                      (e) => e,
                    )
                    .toString()
                    .replaceAll("(", "")
                    .replaceAll(")", ""),
              ),
              const SizedBox(height: 2),
              RowText(
                title: "Price",
                content: "\$${widget.productEntity.purchasePrice.toString()} | Rent: \$${widget.productEntity.rentPrice.toString()} ${widget.productEntity.rentOption.toString()}",
              ),
              const SizedBox(height: 8),
              Wrap(
                children: [
                  Text(
                    widget.productEntity.description.toString(),
                    style: AppText().subHeadline.copyWith(color: AppColor.textPrimary),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: hasAnimatedToFullText ? 20 : 2,
                  ),
                  InkWell(
                    onTap: () {
                      if (!hasAnimatedToFullText) {
                        animation();
                      } else {
                        timer.cancel();
                        animation();
                      }
                    },
                    child: Text(
                      hasAnimatedToFullText ? "Show less .." : "...More Details",
                      style: AppText().footnoteBold.copyWith(color: AppColor.primaryDefault),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RowText(title: "Date Posted", content: DateFormat().add_MMMMEEEEd().format(widget.productEntity.datePosted ?? DateTime.now()))
            ],
          ),
        ),
      ),
    );
  }
}
