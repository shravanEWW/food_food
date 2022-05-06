import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/CartController.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product;
    return Scaffold(
      body: Stack(

        children: [

          Positioned(
              top: Dimensions.ratio * 60,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.ratio * 100,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.ratio * 15),
                // color: AppColors.iconColor,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                     product=  Get.find<PopularProductController>().getPopularProductList();
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(

                              width: double.maxFinite,
                              //color: Colors.blue,
                              margin: EdgeInsets.all(Dimensions.ratio * 10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                      if (popularIndex >= 0) {
                                        Get.toNamed(RoutHelper.getPopularFood(
                                            popularIndex,"cartpage"));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                        Get.toNamed(
                                            RoutHelper.getRecommendedFood(
                                                recommendedIndex,"cartpage"));
                                      }
                                    },
                                    child: Container(
                                        width: Dimensions.ratio * 100,
                                        height: Dimensions.ratio * 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.ratio * 20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD +
                                                  cartController
                                                      .getItems[index].img!,
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: Dimensions.ratio * 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.ratio * 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black,
                                        ),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  "\$ ${cartController.getItems[index].price.toString()}",
                                              color: Colors.redAccent,
                                            ),
                                            Container(

                                              padding: EdgeInsets.all(
                                                  Dimensions.ratio * 5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black45,
                                                      blurRadius:
                                                          Dimensions.ratio *
                                                              5.0,
                                                      offset: Offset(
                                                          Dimensions.ratio * 5,
                                                          Dimensions.ratio *
                                                              5)),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        Dimensions.ratio * 10)),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(_cartList[index].product!, -1);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.ratio * 10,
                                                    ),
                                                    BigText(
                                                      // text: "popularProduct.inCartItems.toString()",
                                                      text: _cartList[index]
                                                          .quantity
                                                          .toString(),
                                                      color:
                                                          AppColors.mainColor,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.ratio * 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(product, 1);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    })),
              ))
        ],
      ),
      bottomNavigationBar:
      GetBuilder<CartController>(builder: (cartController) {
        return Container(
          padding: EdgeInsets.all(Dimensions.ratio*15),
          margin: EdgeInsets.only(
              bottom: Dimensions.ratio * 5,
              right: Dimensions.ratio * 5,
              left: Dimensions.ratio * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.ratio * 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: Dimensions.ratio * 5.0,
                        offset: Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                  ],
                  borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
                ),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                  BigText(
                    text: "\$ " + cartController.totalAmount.toString(),
                    color: AppColors.mainColor,
                    size: Dimensions.ratio*18,
                  ),

                ]),
              ),
              GestureDetector(
                  onTap: () {
                  //  popularProduct.addItem(product);
                  },
                  child: Container(
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
                        text: "Checkout",
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
    );

  }

}
