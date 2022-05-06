import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/cart/cart_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  int _selectedIndex = 0;
  late PersistentTabController _controller;

  /*List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page"))),
    Container(child: Center(child: Text("Next Next Page"))),
    Container(child: Center(child: Text("Next Next Next Page"))),
  ];*/
/*
  void onTapNav(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }*/
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: const Center(child: Text("History Page"))),
      CartPage(),
      Container(child: const Center(child: Text("Profile Page"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.home,),
        title: ("home"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor4,
        inactiveColorPrimary: AppColors.iconColor4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.archivebox_fill
        ),
        title: ("history"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor4,
        inactiveColorPrimary: AppColors.iconColor4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.cart
        ),
        title: ("cart"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor4,
        inactiveColorPrimary: AppColors.iconColor4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person,
        ),
        title: ("me"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor4,
        inactiveColorPrimary: AppColors.iconColor4,
      ),
    ];
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.iconColor5,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap:onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label: "history"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: "me"),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: createDrawer(),
      appBar: AppBar(
        title: Text("Food App"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,

      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style7, // Choose the nav bar style with this property.
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
              accountName:Text("John Doe",style: TextStyle(color: Colors.red,)) ,
              accountEmail: Text( "JohnDoe@gmail.com"),
              currentAccountPicture: CircleAvatar(

                  backgroundImage: NetworkImage(
                      "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528"
                  )),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey,
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
