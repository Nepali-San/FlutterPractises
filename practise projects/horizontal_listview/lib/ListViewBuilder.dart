import 'package:flutter/material.dart';
import 'package:horizontal_listview/content.dart';

class ListviewBuilder extends StatelessWidget {
  //List of images, include this at pubspec.yaml file too.
  final List<String> images = [
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg'
  ];

  final List<String> imageName = [
    'Amazing Sky',
    'Android',
    'Horses',
    'Galaxy',
    'Buddha',
  ];

  @override
  Widget build(BuildContext context) {
    //assert is used for debugging , it the statement inside the assert is False,
    //we get it as error.
    assert(imageName.length == images.length);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Content(images[index], imageName[index]);
      },
      itemCount: images.length,
    );
  }
}
