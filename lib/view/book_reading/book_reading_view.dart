import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/color_extension.dart';

class BookReadingView extends StatefulWidget {
  final Map bObj;
  const BookReadingView({super.key, required this.bObj});

  @override
  State<BookReadingView> createState() => _BookReadingViewState();
}

class _BookReadingViewState extends State<BookReadingView> {
  double fontSize = 20;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                widget.bObj["name"].toString(),
                style: TextStyle(
                    color: isDark ? Colors.white : TColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch(
                      activeColor: TColor.primary,
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          isDark = value;
                        });
                      },
                    ),
                    Text(
                      "Dark ",
                      style: TextStyle(
                          color: isDark ? Colors.white : TColor.text,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          builder: (context) {
                            var orientation =
                                MediaQuery.of(context).orientation;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal:
                                      orientation == Orientation.portrait
                                          ? 25
                                          : 60),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: TColor.text,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.text_decrease,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                              updateUi();
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.text_increase,
                                        color: TColor.text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: TColor.textbox,
                                        border: Border.all(
                                            color: Colors.black26, width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: const Text("Font"),
                                      underline: Container(),
                                      items: ["Font1", "Font2"].map((name) {
                                        return DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        );
                                      }).toList(),
                                      onChanged: (selectVal) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome
                                              .setPreferredOrientations([
                                            DeviceOrientation.portraitDown,
                                            DeviceOrientation.portraitUp
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.portrait
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_portrait,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome
                                              .setPreferredOrientations([
                                            DeviceOrientation.landscapeLeft,
                                            DeviceOrientation.landscapeRight
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.landscape
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_landscape,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.settings,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            )
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: SelectableText(
            """ Once upon a time in a bustling city, there lived a young and ambitious entrepreneur. From a young age, they had a strong desire to create something of their own. They were always full of ideas and had an unwavering passion for technology.

In their college days, while studying computer science, they came up with a groundbreaking idea for a mobile app that could revolutionize the way people connected and communicated. With nothing but a small team of like-minded friends and their own determination, they set out to turn this idea into a reality.

The journey was far from easy. They faced countless challenges, from finding initial funding to dealing with technical hurdles and fierce competition. But what set this entrepreneur apart was their resilience and unwavering belief in their vision.

They worked tirelessly, putting in long hours, and learning from every setback. They sought advice from experienced mentors and continuously improved their product. Slowly but steadily, their app gained traction, and users began to see its value.

As the app grew in popularity, investors started taking notice. They secured funding that allowed them to expand their team and reach even more users. The entrepreneur's leadership skills shone as they built a talented and passionate team who shared their vision.

Years passed, and the app became a household name, with millions of users worldwide. It had not only transformed communication but had also created job opportunities for many. The entrepreneur's dream had come true, and they had become a successful and respected figure in the tech industry.

But success didn't change them. They remained humble and continued to innovate. They used their wealth and influence to support charitable causes and mentor aspiring entrepreneurs. They believed in giving back to the community that had supported their journey.

This entrepreneur's story serves as a reminder that with determination, innovation, and a strong belief in your ideas, you can overcome any obstacle and achieve your dreams. They proved that being an entrepreneur isn't just about making money; it's about making a positive impact on the world and inspiring others to do the same.

As a technology enthusiast and aspiring Flutter developer, you can draw inspiration from this entrepreneur's journey and apply their principles of hard work, innovation, and resilience to your own path towards becoming a pro in building Flutter mobile applications.\n  As the entrepreneur's app continued to thrive, they decided to diversify their ventures. They started investing in other promising startups and mentoring young, aspiring entrepreneurs. Their guidance and support proved invaluable to many, helping them navigate the challenges of building their own businesses.

One day, the entrepreneur stumbled upon a unique opportunity in the emerging field of artificial intelligence (AI). They recognized the potential for AI to transform industries and improve people's lives. With their characteristic vision and ambition, they founded a new company focused on AI-driven solutions.

This endeavor was met with skepticism, as AI was still relatively uncharted territory. However, the entrepreneur's determination and their ability to assemble a talented team of AI experts soon paid off. Their company developed innovative AI algorithms that had applications in healthcare, finance, and even environmental conservation.

Their AI solutions not only improved efficiency but also made a significant impact on society. For example, their healthcare AI helped diagnose diseases at an early stage, saving countless lives. Their financial AI made investing more accessible to people, empowering them to achieve financial security. And their environmental AI contributed to the conservation of natural resources and the protection of endangered species.

The entrepreneur's commitment to making a positive difference in the world didn't stop there. They initiated philanthropic projects, supporting education in underserved communities and funding research into clean energy solutions. Their dedication to giving back was a testament to their values and the impact they wanted to have on society.

As years went by, the entrepreneur's name became synonymous with innovation and philanthropy. They were invited to speak at conferences, where they shared their insights and inspired the next generation of entrepreneurs. Their success story was a beacon of hope for those who aspired to make a difference through technology and entrepreneurship.

In the end, this entrepreneur's journey was not just about achieving financial success but about leaving a lasting legacy of positive change. They showed that with a combination of vision, hard work, adaptability, and a commitment to making the world a better place, an entrepreneur can truly make a mark on the world.
 

""",
            style: TextStyle(
                color: isDark ? Colors.white : TColor.text, fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  void updateUi() {
    setState(() {});
  }
}
