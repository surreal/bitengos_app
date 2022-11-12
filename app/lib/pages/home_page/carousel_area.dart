import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:itcm_site/design/app_colors.dart';

import '../../helpers/orientation_helper.dart';

class CarouselArea extends StatefulWidget {
  _CarouselAreaState createState() => _CarouselAreaState();
}

class _CarouselAreaState extends State<CarouselArea> {
  int _currentIndex = 0;
  _CarouselAreaState() {
    log('checkLifecycle -> _CarouselCustomState{} -> _currentIndex == ' + _currentIndex.toString());
  }

  final List<String> imgList = ['assets/images/tehen_slide.png', 'assets/images/build_it_slide.png', 'assets/images/t4t_slide.png'];

  @override
  Widget build(BuildContext context) {
    log('checkCarousel -> CarouselCustom{} -> build()');
    List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            height: 400,
            width: setGetScreenWidth(context),
            child: Image.asset(
              item,
              fit: BoxFit.fill,
            ),
          ),
        )
        .toList();

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: setGetScreenHeight(context) - 200,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              initialPage: 0,
              autoPlayInterval: Duration(seconds: 7),
              autoPlayAnimationDuration: Duration(milliseconds: 2800),
              autoPlayCurve: Curves.decelerate,
              enlargeCenterPage: false,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  // log('checkCarousel -> CarouselCustom{} -> build() -> CarouselOptions() -> setState() -> currentIndex == ' +
                  //     _currentIndex.toString() +
                  //     '; reason == ' +
                  //     reason.toString());
                });
              },
            ),
          ),
          Container(
            color: blackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 18.0,
                  height: 18.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blueAccent : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    log('checkCarousel -> dispose()');
    super.dispose();
  }
}
