import 'package:flutter/material.dart';
import 'package:food_app/pages/orders.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';

import '../../utils/colors.dart';
import '../cart/cart_page.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    /*print("height: " + MediaQuery.of(context).size.height.toString());
    print("screenHeight: " + Dimensions.screenHeight.toString());*/

    return Scaffold(
      drawer: createDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.ratio * Dimensions.padding1),
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.ratio * 20, right: Dimensions.ratio * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Ahmedabad",
                        color: AppColors.mainColor,
                        size: Dimensions.ratio * 16,
                      ),
                      Row(
                        children: [
                          SmallText(
                              text: "Sola",
                              color: Colors.black54,
                              size: Dimensions.ratio * 12),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.ratio * 40,
                      width: Dimensions.ratio * 40,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.ratio * 12),
                        color: AppColors.mainColor,
                      ),
                      child: AppIcon(
                        icon: Icons.search,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
  createDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white,),
              accountName:Text("") ,
              accountEmail: Text( "email"),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528")),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
            ),
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.home,color: Colors.orangeAccent,),
            title: Text('Home',),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.shopping_basket,color: Colors.orangeAccent,),
            title: Text('Cart'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.fastfood,color: Colors.orangeAccent,),
            title: Text('My Order'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.clear,color: Colors.orangeAccent,),
            title: Text('Logout'),
            onTap: () async {
             // final AuthMethods _authMethods = AuthMethods();
             // await _authMethods.logout();
            },
          ),
        ],
      ),
    );
  }

}
