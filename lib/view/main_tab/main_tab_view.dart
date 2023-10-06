import 'package:cp_book_store/common/color_extension.dart';
import 'package:cp_book_store/view/account/account_view.dart';
import 'package:cp_book_store/view/home/home_view.dart';
import 'package:cp_book_store/view/our_book/our_books_view.dart';
import 'package:cp_book_store/view/search/search_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.dColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(media.width * 0.7),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      decoration: selectMenu == index
                          ? BoxDecoration(
                              color: TColor.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: TColor.primary,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            )
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OurBooksView()));
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          } else if (index == 7) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountView()));
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          }

                          setState(() {
                            selectMenu = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                  color: selectMenu == index
                                      ? Colors.white
                                      : TColor.text,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              mObj["icon"] as IconData? ?? Icons.home,
                              color: selectMenu == index
                                  ? Colors.white
                                  : TColor.primary,
                              size: 33,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: TColor.subTitle,
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const HomeView(),
          const SearchView(),
          Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.arrow_back_ios,
                size: 21,
              ),
              backgroundColor: TColor.primary,
              title: const Text(
                "WishList",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "🥲",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Oops! Nothing in Wishlist.",
                    style: TextStyle(
                        color: TColor.subTitle,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const AccountView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary,
        child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Wishlist",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Account",
              ),
            ]),
      ),
    );
  }
}
