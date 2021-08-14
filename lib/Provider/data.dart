import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class Data {
  final String id;
  final String name;
  final int phnumber;
  final String address;
  final DateTime deliveryDate;
  final String requirements;
  final String orderno;
  final DateTime date;
  final File fabricColor;
  final double chest;
  final double waist;
  final double hip;
  final double shoulder;
  final double height;
  final double topbottom;
  final double frontNeck;
  final double backNeck;
  final double sleeve;
  final double length;
  final double ghera;
  final double bottomwaist;
  final double bottohip;
  final double bottomlength;
  final String description;
  final Image picture;

  Data({
    this.picture,
    @required this.id,
    @required this.name,
    @required this.phnumber,
    @required this.address,
    this.deliveryDate,
    this.requirements,
    this.date,
    this.fabricColor,
    this.orderno,
    this.chest,
    this.waist,
    this.hip,
    this.shoulder,
    this.height,
    this.topbottom,
    this.frontNeck,
    this.backNeck,
    this.sleeve,
    this.length,
    this.ghera,
    this.bottohip,
    this.bottomlength,
    this.bottomwaist,
    this.description,
  });
}
