import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/popular_product_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MenuItem extends StatelessWidget {
  MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var product = Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Items"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),

      body: Stack(
        children: [
/*
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
*/
          Positioned(
              top: Dimensions.ratio * 0,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.ratio * 15),
                // color: AppColors.iconColor,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(right: Dimensions.ratio*20),
                            //color: Colors.blue,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: Dimensions.ratio * 120,
                                    height: Dimensions.ratio * 120,
                                    margin: EdgeInsets.only(bottom: Dimensions.ratio*20),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Dimensions.ratio * 20)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/food1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black45,
                                            blurRadius:
                                            Dimensions.ratio * 5.0,
                                            offset: Offset(
                                                Dimensions.ratio * 5,
                                                Dimensions.ratio * 5)),
                                      ],
                                    ),
                                  ),
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
                                        text: "Margherita Pizza",
                                        color: Colors.black,
                                        size: Dimensions.ratio * 20,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: "\$ 45",
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
                                                        Dimensions.ratio * 5.0,
                                                    offset: Offset(
                                                        Dimensions.ratio * 5,
                                                        Dimensions.ratio * 5)),
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
                                                      //cartController.addItem(_cartList[index].product!, -1);
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
                                                    text: "5",
                                                    color: AppColors.mainColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.ratio * 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
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
                        })),
              ))
        ],
      ),
        bottomNavigationBar:
        GetBuilder<PopularProductController>(builder: (controller) {
          return Container(
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
                  //  controller.addItem(product);
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
                        text: " Add to cart"
                           // "\$${product.price!} Add to cart"
                        ,
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
          );
        }));
     }
}
