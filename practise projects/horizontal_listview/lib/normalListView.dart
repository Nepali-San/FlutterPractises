import 'package:flutter/material.dart';
import 'package:horizontal_listview/content.dart';

//content includes a image and name for image. see content.dart

class NormalListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Content(images[index], imageName[index]);
      },
      itemCount: 5,
    );
  }
}
