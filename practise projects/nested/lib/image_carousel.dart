import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> titleimages = [
    'images/titleimage1.jpg',
    'images/titleimage2.jpg',
    'images/titleimage3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width  =MediaQuery.of(context).size.width;

    Widget slidingimage() {
      return CarouselSlider(
        height: height * 0.25,
        items: titleimages.map(
          (image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 1.0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ));
              },
            );
          },
        ).toList(),
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: true,
      );
    }

    return height > 500 ? slidingimage() : Container();
  }
}
