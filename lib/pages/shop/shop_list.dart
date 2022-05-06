import 'package:flutter/material.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop List"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        child: list(),
      ),
    );
  }

  list() {
    return SingleChildScrollView(
      child: GetBuilder<PopularProductController>(
          builder: (recommendedProducts) {
            return recommendedProducts.isLoaded
                ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProducts.popularProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutHelper.getShopDetail(index, "home"));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.ratio*20,
                          left: Dimensions.ratio * 20,
                          right: Dimensions.ratio * 20,),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.ratio * 110,
                                        top: Dimensions.ratio * 15,
                                        bottom: Dimensions.ratio * 15,
                                        right: Dimensions.ratio * 40),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: recommendedProducts
                                              .popularProductList[index]
                                              .name!,
                                          size: Dimensions.ratio * 20,
                                        ),
                                        SizedBox(
                                          height: Dimensions.ratio * 5,
                                        ),
                                        Text(
                                          recommendedProducts
                                              .popularProductList[index]
                                              .description!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColors.paraColor,
                                            fontSize: Dimensions.ratio * 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions.ratio * 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                                icon: Icons.circle_sharp,
                                                text: "Normal",
                                                size: Dimensions.ratio * 20,
                                                iconColor: AppColors.iconColor),
                                            IconAndTextWidget(
                                                icon: Icons.location_on,
                                                text: "1.7km",
                                                size: Dimensions.ratio * 20,
                                                iconColor: AppColors.iconColor2),
                                            IconAndTextWidget(
                                                icon: Icons.access_time_rounded,
                                                text: "32min",
                                                size: Dimensions.ratio * 20,
                                                iconColor: AppColors.iconColor3)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      top: Dimensions.ratio * 10,
                                      bottom: Dimensions.ratio * 10,
                                      left: Dimensions.ratio * 20),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFFe8e8e8),
                                          blurRadius: Dimensions.ratio * 5.0,
                                          offset: Offset(Dimensions.ratio * -1,
                                              Dimensions.ratio * 5)),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(Dimensions.ratio * -5,
                                              Dimensions.ratio * 0))
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                      Radius.circular(Dimensions.ratio * 20),
                                      bottomRight:
                                      Radius.circular(Dimensions.ratio * 20),
                                    ),
                                    color: Colors.white10,
                                  ),
                                ),
                                Container(
                                  height: Dimensions.ratio * 120,
                                  width: Dimensions.ratio * 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.ratio * 20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFFe8e8e8),
                                            blurRadius: Dimensions.ratio * 5.0,
                                            offset: Offset(Dimensions.ratio * -1,
                                                Dimensions.ratio * 5)),
                                      ],
                                      color: Colors.white30,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(AppConstants
                                              .BASE_URL +
                                              AppConstants.UPLOAD +
                                              recommendedProducts
                                                  .popularProductList[index]
                                                  .img!))),
                                ),
                              ],
                            ),
                          )
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

