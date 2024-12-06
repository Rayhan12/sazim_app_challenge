import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/color_config.dart';
import 'package:sazim_app/app/core/theme/text_config.dart';
import 'package:sazim_app/app/core/widgets/title_content.dart';
import 'package:sazim_app/app/modules/history/views/history_view.dart';
import 'package:sazim_app/app/modules/product_management/views/product_management_view.dart';
import 'package:sazim_app/app/modules/shop/views/shop_view.dart';
import 'package:sazim_app/app/modules/user_products/views/user_products_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if(controller.currentPage.value == 2)
            {
              return Text("History",style: AppText().title2,);
            }
          else
            {
              return Container();
            }
        },)
      ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              leading: const Icon(RIcon.Logout,color: AppColor.textPrimary,),
              title: Text("Logout",style: AppText().subHeadlineSemiBold,),
              onTap: ()=> controller.logOutUserAndSendToLogin(),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        pageSnapping: true,
        allowImplicitScrolling: false,
        /// Todo: Fix scrolling delay
        children:  const [
          UserProductsView(),
          // ProductManagementView(),
          ShopView(),
          HistoryView()
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: AppColor.primaryDefault,
          unselectedItemColor: AppColor.textSecondary,
          selectedLabelStyle: AppText().subHeadlineSemiBold,
          unselectedLabelStyle: AppText().subHeadline,
          currentIndex: controller.currentPage.value,
          onTap: (index) => controller.updatePage(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(RIcon.Home_Smile,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(RIcon.Cart_Check), label: "Shop"),
            BottomNavigationBarItem(icon: Icon(RIcon.History_2), label: "History"),
            BottomNavigationBarItem(icon: Icon(RIcon.Add_Circle), label: "Add Product"),
          ],
        );
      },),
    );
  }
}
