import 'package:flutter/material.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
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
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        child: list(),
      ),
    );
  }

  list() {
    return SingleChildScrollView(
      child: GetBuilder<PopularProductController>(builder: (items) {
        return items.isLoaded
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.popularProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutHelper.getPopularFood(index, "home"));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.ratio * 20,
                        left: Dimensions.ratio * 20,
                        right: Dimensions.ratio * 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: double.maxFinite,
                            //color: Colors.blue,
                            margin: EdgeInsets.all(Dimensions.ratio * 10),
                            child: Row(
                              children: [
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
                                        text: "",
                                        color: Colors.black,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$ ${items.getItems[index].price.toString()}",
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
                                                      items.setQuantity(false);
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
                                                     text: items.inCartItems.toString(),
                                                   // text: items.popularProductList[index].quantity,
                                                    color: AppColors.mainColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.ratio * 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      items.setQuantity(true);
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
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
    );
  }
}
