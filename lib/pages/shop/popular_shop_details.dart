import 'package:flutter/material.dart';
import 'package:food_app/controllers/CartController.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../widgets/app_column.dart';
import '../../utils/colors.dart';
import '../home/main_food_page.dart';

class PopularShopDetails extends StatelessWidget {
  final int pageId;
  final String page;
 const PopularShopDetails({Key? key, required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    // print("page id id "+pageId.toString());
    // print("product name is "+product.name.toString());

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          //backGround Image

          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350 * Dimensions.ratio,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD +
                            product.img!))),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.ratio * 45,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {

                      if(page=="cartpage"){
                        Get.toNamed(RoutHelper.getCartPage());
                      }else{
                        Get.toNamed(RoutHelper.getInitial());

                      }
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
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
                          controller.totalItems >= 1
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
                          controller.totalItems >= 1
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
                  })
                ],
              )),
          //introduction of food
          Positioned(
            top: Dimensions.ratio * 350 - Dimensions.ratio * 30,
            left: 0,
            right: 0,
            bottom: 0,
            // padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.ratio * 20,
                  right: Dimensions.ratio * 20,
                  top: Dimensions.ratio * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.ratio * 20,
                  ),
                  BigText(
                    text: "Introduce",
                    size: Dimensions.ratio * 20,
                  ),
                  SizedBox(
                    height: Dimensions.ratio * 15,
                  ),
                  //expandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                        child: ExpandableText(text: product.description!)),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.ratio * 20),
                    topLeft: Radius.circular(Dimensions.ratio * 20),
                  ),
                  color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          margin: EdgeInsets.only(
              bottom: Dimensions.ratio * 5,
              right: Dimensions.ratio * 5,
              left: Dimensions.ratio * 1),
          height: Dimensions.ratio * 115,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimensions.ratio * 50,
                width: Dimensions.ratio * 120,
                margin: EdgeInsets.all(Dimensions.ratio * 20),
                padding: EdgeInsets.all(Dimensions.ratio * 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: Dimensions.ratio * 5.0,
                        offset:
                            Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                  ],
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 10,
                  ),
                  BigText(
                    text: popularProduct.inCartItems.toString(),
                    color: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ]),
              ),
              GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
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
                            offset: Offset(
                                Dimensions.ratio * 0, Dimensions.ratio * 5)),
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.ratio * 20)),
                    ),
                    child: Row(children: [
                      BigText(
                        text: "\$ ${product.price!}" + " Add to cart",
                        size: Dimensions.ratio * 16,
                        color: Colors.white,
                      ),
                    ]),
                  )),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: Dimensions.ratio * 5.0,
                  offset: Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
            ],
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.ratio * 30)),
          ),
        );
      }),
    ));
  }
}
