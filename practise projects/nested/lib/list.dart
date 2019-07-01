import 'package:flutter/material.dart';

class Listv extends StatelessWidget {
  final int id;
  Listv(this.id);
  final List<String> images = [
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg'
  ];

  Widget content(String imag, String imageName) {
    return Column(
      children: <Widget>[Text(imageName), Text(imag)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: id == 1 ? Axis.vertical : Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return content(images[index], index.toString());
      },
      itemCount: images.length,
    );
  }
}
