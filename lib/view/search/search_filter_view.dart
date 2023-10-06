import 'package:cp_book_store/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/color_extension.dart';

class SearchFilterView extends StatefulWidget {
  final Function(Map)? didFilter;
  const SearchFilterView({super.key, this.didFilter});

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  int selectSort = 0;
  int selectGenre = 0;
  int selectRate = 0;
  bool genreShowMore = false;

  List sortByArr = [
    "Featured Titles",
    "Price: Low to High",
    "Price: High to Low",
    "Publication Date",
    "A - Z"
  ];
  List genreArr = [
    "Biography",
    "Business & Economics",
    "Children",
    "Cookery",
    "Fiction",
    "Biography1",
    "Business & Economics1",
    "Children1",
    "Cookery1",
    "Fiction1"
  ];

  List ratingArr = [5.0, 4.0, 3.0, 2.0, 1.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(),
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Filter",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ),
              child: Text(
                "Sort by",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              itemCount: sortByArr.length,
              itemBuilder: (context, index) {
                var itemName = sortByArr[index] as String? ?? "";

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectSort = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          selectSort == index
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          color: selectSort == index
                              ? TColor.primary
                              : TColor.subTitle,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Text(
                "Genre",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              itemCount: genreShowMore
                  ? genreArr.length
                  : (genreArr.length > 5 ? 5 : genreArr.length),
              itemBuilder: (context, index) {
                var itemName = genreArr[index] as String? ?? "";

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGenre = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          selectGenre == index
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          color: selectGenre == index
                              ? TColor.primary
                              : TColor.subTitle,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  genreShowMore = !genreShowMore;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    Icon(
                      genreShowMore ? Icons.expand_less : Icons.expand_more,
                      size: 22,
                      color: TColor.primaryLight,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        genreShowMore ? "Hide" : "See more",
                        style: TextStyle(
                          color: TColor.primaryLight,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Text(
                "Average Customer Review",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              itemCount: ratingArr.length,
              itemBuilder: (context, index) {
                var itemName = ratingArr[index] as double? ?? 1.0;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectRate = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          selectRate == index
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          color: selectRate == index
                              ? TColor.primary
                              : TColor.subTitle,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: itemName,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: TColor.primary,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: RoundButton(
            title: "Apply",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
