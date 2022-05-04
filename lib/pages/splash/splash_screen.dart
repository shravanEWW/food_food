import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    //Get.find<CartController>().totalItems;
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
        Duration(seconds: 3), () => Get.offNamed(RoutHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                "assets/images/logo.png",
                width: Dimensions.ratio * 200,
              ))),
          SizedBox(
            height: Dimensions.ratio * 20,
          ),
          ScaleTransition(
            scale: animation,
            child: BigText(
              text: "Tasty Food",
              size: Dimensions.ratio * 50,
              color: AppColors.iconColor5,
            ),
          )
        ],
      ),
    );
  }
}
