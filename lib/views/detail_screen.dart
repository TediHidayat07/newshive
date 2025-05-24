import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newshive/views/utils/helper.dart';
import 'package:newshive/views/widgets/rich_text_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log('Bookmark onTap');
            },
            icon: Icon(Icons.bookmark_border_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/300/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            vsSmall,
            Text(
              'Trump\'s trade war hits his second-favorite set of wheels, the golf cart',
              style: headline4.copyWith(fontWeight: semibold),
            ),
            vsSmall,
            RichTextWidget(
              textOne: 'Publish at ',
              textStyleOne: subtitle2.copyWith(color: cBlack),
              cTextOne: cBlack,
              textTwo: 'Mach 30, 2025',
              textStyleTwo: subtitle2.copyWith(
                color: cBlack,
                fontWeight: semibold,
              ),
              cTextTwo: cBlack,
            ),
            RichTextWidget(
              textOne: 'Source ',
              textStyleOne: subtitle2.copyWith(color: cBlack),
              cTextOne: cBlack,
              textTwo: 'nbcnews.com',
              textStyleTwo: subtitle2.copyWith(
                color: cBlack,
                fontWeight: semibold,
              ),
              cTextTwo: cBlack,
            ),
            RichTextWidget(
              textOne: 'Category ',
              textStyleOne: subtitle2.copyWith(color: cBlack),
              cTextOne: cBlack,
              textTwo: 'General, Politics',
              textStyleTwo: subtitle2.copyWith(
                color: cBlack,
                fontWeight: semibold,
              ),
              cTextTwo: cBlack,
            ),
            vsSmall,
            Text(
              'Across the first 100 days of his second term and ups and downs in the level of tariff threats, President Trump, an avid golfer, has often been on the course and photographed in a golf cart, typically a cart made by domestic companies Club Car or E-Z-Go. Across the first 100 days of his second term and ups and downs in the level of tariff threats, President Trump, an avid golfer, has often been on the course and photographed in a golf cart, typically a cart made by domestic companies Club Car or E-Z-Go. Across the first 100 days of his second term and ups and downs in the level of tariff threats, President Trump, an avid golfer, has often been on the course and photographed in a golf cart, typically a cart made by domestic companies Club Car or E-Z-Go.',
              style: subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
