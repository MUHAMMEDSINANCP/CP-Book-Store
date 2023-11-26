import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp_book_store/common/color_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widget/your_review_row.dart';

class AccountView extends StatefulWidget {
  const AccountView({
    super.key,
  });

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  void fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        userName = userSnapshot['name'];
      });
    }
  }

  List purArr = ["assets/img/p1.jpg", "assets/img/p2.jpg", "assets/img/p3.jpg"];

  List sResultArr = [
    {
      "img": "assets/img/p3.jpg",
      "description": "Best book, I ever read..👌❤️",
      "rate": 4.5
    },
    {
      "img": "assets/img/p1.jpg",
      "description":
          "A must read for everybody. This book taught me so many things about...🤗",
      "rate": 4.0
    },
    {
      "img": "assets/img/p2.jpg",
      "description": "💯Entrepreneurs Must Read...! Go for it!!",
      "rate": 4.2
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Constantly travelling and keeping up to date with business related books.",
                          style:
                              TextStyle(color: TColor.subTitle, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/img/u1.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me_sharp,
                    size: 15,
                    color: TColor.subTitle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "Kerala, India",
                      style: TextStyle(
                        color: TColor.subTitle,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.button),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: TColor.primary,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Edit profile",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "21",
                        style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Books",
                        style: TextStyle(
                          color: TColor.subTitle,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          color: TColor.subTitle,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Text(
                "Your Purchases (16)",
                style: TextStyle(
                    color: TColor.subTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: media.width * 0.37,
                  width: media.width * 0.5,
                  decoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: purArr.map(
                      (iName) {
                        var isFirst = purArr.first == iName;
                        var isLast = purArr.last == iName;
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          padding: isFirst
                              ? const EdgeInsets.only(left: 25)
                              : (isLast
                                  ? const EdgeInsets.only(right: 25)
                                  : null),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                iName,
                                height: media.width * 0.5,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Text(
                "Your reviews (8)",
                style: TextStyle(
                    color: TColor.subTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                itemCount: sResultArr.length,
                itemBuilder: (context, index) {
                  var rObj = sResultArr[index] as Map? ?? {};
                  return YourReviewRow(sObj: rObj);
                })
          ],
        ),
      ),
    );
  }
}
