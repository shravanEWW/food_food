import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions.dart';

class MenuCategory extends StatelessWidget {
  const MenuCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu Category"),
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
        ),
        body: GetBuilder<PopularProductController>(builder: (items) {
          return GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(items.popularProductList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutHelper.getMenuItem());
                },
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.ratio * 120,
                      width: Dimensions.ratio * 120,
                      margin: EdgeInsets.all(Dimensions.ratio * 20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.ratio * 20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius:
                                Dimensions.ratio * 5.0,
                                offset: Offset(
                                    Dimensions.ratio * 5,
                                    Dimensions.ratio * 5)),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstants.BASE_URL +
                                  AppConstants.UPLOAD +
                                  items.popularProductList[index].img!))),
                    ),
                    Container(
                        width: Dimensions.ratio * 100,
                        child: Center(
                            child: BigText(
                          text: items.popularProductList[index].name,
                          size: Dimensions.ratio * 16,
                        ))),
                  ],
                ),
              );
            }),
          );
        }));
  }
}
