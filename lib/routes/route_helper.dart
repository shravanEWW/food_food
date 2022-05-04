import 'package:food_app/pages/food/menu_category.dart';
import 'package:food_app/pages/food/recommended_food_details.dart';
import 'package:food_app/pages/shop/shop_detail_page.dart';
import 'package:food_app/pages/shop/shop_list.dart';
import 'package:food_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/menu_item.dart';
import '../pages/home/home_page.dart';
import '../pages/shop/popular_shop_details.dart';

class RoutHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String shopList = "/shop-list";
  static const String shopDetail = "/shop-detail";
  static const String menuCategory = "/menu-category";
  static const String menuItem = "/menu-item";

  static String getSplashPage() => '$splashPage';

  static String getInitial() => '$initial';

  static String getCartPage() => '$cartPage';

  static String getShopList() => '$shopList';

  static String getMenuCategory() => '$menuCategory';

  static String getMenuItem() => '$menuItem';

  static String getShopDetail(int pageId, String page) =>
      '$shopDetail?pageId=$pageId&page=$page';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static List<GetPage> routes = [
    GetPage(
        name: splashPage,
        page: () {
          return SplashScreen();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];

          return PopularShopDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.zoom),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(
              pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.zoom),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.zoom),
    GetPage(
        name: shopList,
        page: () {
          return ShopList();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: shopDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return ShopDetailPage(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: menuCategory,
        page: () {
          return MenuCategory();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: menuItem,
        page: () {
          return MenuItem();
        },
        transition: Transition.rightToLeftWithFade),
  ];
}
