import 'package:flutter/material.dart';
import 'package:tailorstitch/Provider/data.dart';

class DataProvider with ChangeNotifier {
  List<Data> _items = [];
  List<Data> get items {
    return [..._items];
  }

  List<Data> _client = [];
  List<Data> get client {
    return [..._client];
  }

  Future<void> addProducts(
    String id,
    int phnumber,
    String name,
    String address,
    double chest,
    double waist,
    double hip,
    double height,
    double sleeve,
    double length,
    double ghera,
    double bottom,
    double shoulder,
    double frontneck,
    double backneck,
    double hipdown,
    double waistdown,
    double lengthdown,
    String description,
    Image picture,
  ) async {
    final newdata = Data(
      name: name,
      id: id,
      address: address,
      phnumber: phnumber,
      chest: chest,
      waist: waist,
      hip: hip,
      height: height,
      sleeve: sleeve,
      length: length,
      ghera: ghera,
      topbottom: bottom,
      shoulder: shoulder,
      frontNeck: frontneck,
      backNeck: backneck,
      bottohip: hipdown,
      bottomlength: lengthdown,
      bottomwaist: waistdown,
      picture: picture,
    );
    print(newdata.picture);
    _client.add(newdata);
    notifyListeners();
  }
}
