import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final image, imageName;

  Content(this.image, this.imageName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 150,
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.all(3.0),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 5.0),
          Container(
            width: 120,
            child: Center(
              child: Text(
                imageName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
