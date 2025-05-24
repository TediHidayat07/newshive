import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newshive/views/utils/form_validator.dart';
import '../routes/route_names.dart';
import 'utils/helper.dart';
import 'widgets/custom_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TabController tabController;
  int currentTabIndex = 0;
  int currentCarouselIndex = 0;

  List<Map<String, dynamic>> carouselItems = [
    {
      'image': 'https://picsum.photos/id/189/300/200',
      'title': 'Lorem ipsum sit dolor',
    },
    {
      'image': 'https://picsum.photos/id/191/300/200',
      'title': 'Ipsum sit dolor Amet',
    },
    {
      'image': 'https://picsum.photos/id/195/300/200',
      'title': 'Sit dolor Amet consectetur',
    },
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhite,
        leading: Image.asset(
          'assets/images/news logo.png',
          width: 36.w,
          fit: BoxFit.contain,
        ),
        title: Text(
          'Newshive',
          style: headline4.copyWith(color: cPrimary, fontWeight: bold),
        ),
      ),
      backgroundColor: cWhite,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vsSmall,
            CustomFormField(
              controller: searchController,
              hintText: 'Search',
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              suffixIcon: const Icon(Icons.search),
              validator: validateSearch,
            ),
            vsSmall,
            TabBar(
              controller: tabController,
              labelColor: cPrimary,
              unselectedLabelColor: cBlack,
              indicatorColor: cPrimary,
              tabs: const [
                Tab(text: 'Headline'),
                Tab(text: 'Top Stories'),
                Tab(text: 'Similiar News'),
              ],
            ),
            vsSmall,
            SizedBox(
              height: 150.h,
              width: 320.w,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentCarouselIndex = index;
                    });
                  },
                ),
                items:
                    carouselItems.map((item) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['image'],
                              width: 320.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                item['title'],
                                style: subtitle1.copyWith(
                                  color: cWhite,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
            vsSmall,
            Text('All News', style: subtitle1.copyWith(fontWeight: semibold)),
            vsTiny,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log('Card onTap');
                      context.pushNamed(RouteNames.detail);
                    },
                    child: Card(
                      elevation: 0,
                      color: cWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/id/${189 + index}/300/200',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tesla stock jumps after',
                                style: subtitle1.copyWith(fontWeight: semibold),
                              ),
                              Text('Business, Technology', style: caption),
                              vsLarge,
                              Text('2020-12-01', style: caption),
                            ],
                          ),
                          Icon(Icons.bookmark_outline),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
