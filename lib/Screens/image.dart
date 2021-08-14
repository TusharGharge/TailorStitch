import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tailorstitch/Screens/measurescreen.dart';

class Imagefile extends StatelessWidget {
  static const String idScreen = '/Image';
  final File picture;
  Uint8List unit;
  Imagefile({
    this.picture,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.memory(unit);
    void saveimage() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeasureScreen(
              image: image,
            ),
          ));
    }

    // Image imageone = image;
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height*0.24,
        child: image,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('home'),
        onPressed: saveimage,
      ),
    );
  }
}
