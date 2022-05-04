import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/CartController.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text.dart';

class ShopDetailPage extends StatelessWidget {
 final int pageId;
 final String page;

 const ShopDetailPage({Key? key, required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 70,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(page=="cartpage"){
                          Get.toNamed(RoutHelper.getCartPage());
                        }else{
                          Get.toNamed(RoutHelper.getInitial());

                        }                      },
                      child: AppIcon(
                        icon: Icons.clear,
                        size: Dimensions.ratio * 40,
                      ),
                    ),

                    GetBuilder<PopularProductController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutHelper.getCartPage());
                        },
                        child: Stack(
                          children: [
                            AppIcon(
                                icon: Icons.shopping_cart_outlined),
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.shopping_cart_outlined,
                                backgroundColor: AppColors.iconColor2,
                                size: Dimensions.ratio * 20,
                                iconColor: Colors.transparent,
                              ),
                            )
                                : Container(),
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Positioned(
                              right: 5 * Dimensions.ratio,
                              top: 3.4 * Dimensions.ratio,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: Dimensions.ratio * 12,
                                color: Colors.white,
                              ),
                            )
                                : Container()
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Dimensions.ratio * 20),
                  child: Container(
                    padding: EdgeInsets.only(top: 10 * Dimensions.ratio),
                    color: Colors.white,
                    child: Center(
                        child: BigText(
                      text: product.name!,
                      size: Dimensions.ratio * 26,
                    )),
                  ),
                ),
                pinned: true,
                backgroundColor: Colors.yellow,
                expandedHeight: Dimensions.ratio * 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    AppConstants.BASE_URL + AppConstants.UPLOAD + product.img!,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.ratio * 20,
                          top: Dimensions.ratio * 20,
                          right: Dimensions.ratio * 20,
                          bottom: Dimensions.ratio * 20),
                      child: ExpandableText(
                        text: product.description!,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar:
              GetBuilder<PopularProductController>(builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.ratio * 5,
                      bottom: Dimensions.ratio * 5,
                      right: Dimensions.ratio * 5,
                      left: Dimensions.ratio * 1),
                  height: Dimensions.ratio * 115,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(Dimensions.ratio * 20),
                        padding: EdgeInsets.all(Dimensions.ratio * 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: Dimensions.ratio * 5.0,
                                offset: Offset(Dimensions.ratio * 5,
                                    Dimensions.ratio * 5)),
                          ],
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.ratio * 20)),
                        ),
                        child: Container(
                          child: Icon(
                            Icons.heart_broken_rounded,
                            color: AppColors.mainColor,
                            size: Dimensions.ratio * 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutHelper.getMenuCategory());
                        },
                        child: Container(
                          height: Dimensions.ratio * 50,
                          margin: EdgeInsets.all(Dimensions.ratio * 30),
                          padding: EdgeInsets.all(Dimensions.ratio * 15),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: Dimensions.ratio * 5.0,
                                  offset: Offset(Dimensions.ratio * 0,
                                      Dimensions.ratio * 5)),
                            ],
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.ratio * 20)),
                          ),
                          child: Row(children: [
                            BigText(
                              text: "Check Menu ",
                              size: Dimensions.ratio * 16,
                              color: Colors.white,
                            ),
                          ]),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: Dimensions.ratio * 5.0,
                          offset: Offset(
                              Dimensions.ratio * 5, Dimensions.ratio * 5)),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.ratio * 30)),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
