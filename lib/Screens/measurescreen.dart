import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tailorstitch/Provider/dataProvider.dart';
import 'package:tailorstitch/Screens/image.dart';
import 'package:tailorstitch/Screens/paint.dart';
import 'package:intl/intl.dart';

class MeasureScreen extends StatefulWidget {
  static const idScreen = '/MeasureScreen';
  Image image;
  String addressclient;
  String clientname;
  int phoneno;

  MeasureScreen(
      {this.image, this.phoneno, this.clientname, this.addressclient});
  @override
  _MeasureScreenState createState() => _MeasureScreenState();
}

class _MeasureScreenState extends State<MeasureScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _fromTop = true;
  Image image;
  Image imagedata;
  String id = '';
  String name = '';
  double price = 0;
  final nameController = TextEditingController();
  int phnumber = 0;
  final phnumberController = TextEditingController();
  String address = '';
  //final phnumberController = TextEditingController();
  double chest = 0.0;
  //final phnumberController = TextEditingController();
  double waist = 0.0;
  //final phnumberController = TextEditingController();
  double hip = 0.0;
  //final phnumberController = TextEditingController();
  double height = 0.0;
  //final phnumberController = TextEditingController();
  double sleeve = 0.0;
  //final phnumberController = TextEditingController();
  double length = 0.0;
  //final phnumberController = TextEditingController();
  double ghera = 0.0;
  //final phnumberController = TextEditingController();

  double bottom = 0.0;
  //final phnumberController = TextEditingController();
  double shoulder = 0.0;
  //final phnumberController = TextEditingController();
  double frontneck = 0.0;
  //final phnumberController = TextEditingController();
  double backneck = 0.0;
  //final phnumberController = TextEditingController();
  double hipdown = 0.0;
  //final phnumberController = TextEditingController();
  double waistdown = 0.0;
  //final phnumberController = TextEditingController();
  double lengthdown = 0.0;
  //final phnumberController = TextEditingController();
  double bottomdown = 0.0;
  //final phnumberController = TextEditingController();

  String description = '';
  String namec;
  String addressc;
  int phc;
  //final phnumberController = TextEditingController();
  DateTime initalDate = DateTime.now();
  DateTime pickeddate;
  DateTime _selectedDate;
  FocusNode namenode = FocusNode();
  FocusNode phnumbernode = FocusNode();
  FocusNode addressnode = FocusNode();
  FocusNode chestnode = FocusNode();
  FocusNode waistnode = FocusNode();
  FocusNode hipnode = FocusNode();
  FocusNode heightnode = FocusNode();
  FocusNode sleevenode = FocusNode();
  FocusNode lengthnode = FocusNode();
  FocusNode gheranode = FocusNode();
  FocusNode bottomnode = FocusNode();
  FocusNode shouldernode = FocusNode();
  FocusNode frontnecknode = FocusNode();
  FocusNode backnecknode = FocusNode();
  FocusNode hipdownnode = FocusNode();
  FocusNode waistdownnode = FocusNode();
  FocusNode lengthdownnode = FocusNode();
  FocusNode bottomdownnode = FocusNode();
  FocusNode descriptionnode = FocusNode();
  FocusNode priceNode = FocusNode();

  void save() {
    FocusScope.of(context).requestFocus(descriptionnode);
    Provider.of<DataProvider>(context, listen: false).addProducts(
      id,
      phnumber,
      name,
      address,
      chest,
      waist,
      hip,
      height,
      sleeve,
      length,
      ghera,
      bottom,
      shoulder,
      frontneck,
      backneck,
      hipdown,
      waistdown,
      lengthdown,
      description,
      imagedata,
    );
    Navigator.of(context).pop();
  }

  // loadagain() {
  // if (imagedata != null) {
  // image = Image.memory(imagedata);
  // } else {
  // return null;
  // }
  // }
  void deliveryDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2049),
    ).then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    imagedata = widget.image;
    namec = widget.clientname;
    phc = widget.phoneno;
    addressc = widget.addressclient;
    print(name);
    print(widget.clientname);

    // imagedata = widget.unitname;
    // image = Image.memory(imagedata);
    // print(imagedata);
    // if (imagedata != null) {
    // image = Image.memory(imagedata);
    // }

    final appbar = AppBar(
      title: Center(
        child: Text('Measurement '),
      ),
      backgroundColor: Colors.blue[600],
    );
    return Scaffold(
      appBar: appbar,
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: ClipPath(
              clipper: Myclipper(),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue[600],
                        Colors.blue[200],
                      ]),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'Assets/Circles.png',
                    ),
                  ),
                ),
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'Assets/dimagkharab.png',
                              width: 280,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Infocotainer(
            text: 'Client Info',
            svg: 'Assets/womanclient.svg',
            size: 70,
          ),
          SizedBox(
            //
            height: 20,
          ),
          DetailsContainer(
            height: 0.3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 15,
                right: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Inlinecontainer(
                      icon: Icons.person_add_alt_1_outlined,
                      infotext: 'Name : ',
                      child: namec == null
                          ? TextFormField(
                              decoration: InputDecoration(
                                hintText: ' Enter a Person Name',
                              ),
                              onChanged: (val) => name = val,
                              keyboardType: TextInputType.text,
                              focusNode: namenode,
                              textInputAction: TextInputAction.next,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please Enter the name';
                                }
                                return null;
                              },
                            )
                          : Center(
                              child: Text(namec,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                    ),
                  ),
                  SizedBox(height: 2),
                  Inlinecontainer(
                    icon: Icons.phone_android_outlined,
                    infotext: 'Phone : ',
                    child: widget.phoneno == null
                        ? TextFormField(
                            decoration: InputDecoration(
                              hintText: ' Enter a Phone Number',
                            ),
                            onChanged: (val) => phnumber = int.parse(val),
                            keyboardType: TextInputType.number,
                            focusNode: phnumbernode,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please Enter the name';
                              } else if (val.length < 10) {
                                return 'please Enter valid number';
                              }
                              return null;
                            },
                          )
                        : Center(
                            child: Text(widget.phoneno.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
                  ),
                  Inlinecontainer(
                    icon: Icons.home_outlined,
                    infotext: 'address : ',
                    child: widget.addressclient == null
                        ? TextFormField(
                            // maxLines: 1,
                            decoration: InputDecoration(
                              hintText: ' Enter an Address',
                            ),
                            onChanged: (val) => address = val,
                            keyboardType: TextInputType.text,
                            focusNode: addressnode,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please Enter the name';
                              }
                              return null;
                            },
                          )
                        : Center(
                            child: Text(widget.addressclient,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Infocotainer(
            text: 'Top Details',
            svg: 'Assets/top.svg',
            size: 70,
          ),
          SizedBox(
            height: 20,
          ),
          DetailsContainer(
            height: 0.51,
            child: Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 6,
                  right: 5,
                ),
                child: Column(
                  children: [
                    Topcontainer(
                      textfirst: 'Chest : ',
                      textfirstform: 'chest ',
                      textfirsttext: chest,
                      textsecond: 'Waist : ',
                      textsecondform: 'Waist ',
                      textsecondtext: waist,
                    ),
                    Topcontainer(
                      textfirst: 'Hip : ',
                      textfirstform: 'Hip ',
                      textfirsttext: hip,
                      textsecond: 'Height : ',
                      textsecondform: 'Height ',
                      textsecondtext: height,
                    ),
                    Topcontainer(
                      textfirst: 'Sleeve : ',
                      textfirstform: 'Sleeve ',
                      textfirsttext: sleeve,
                      textsecond: 'Length : ',
                      textsecondform: 'Length ',
                      textsecondtext: length,
                    ),
                    Topcontainer(
                      textfirst: 'Ghera : ',
                      textfirstform: 'Ghera ',
                      textfirsttext: ghera,
                      textsecond: 'Bottom  : ',
                      textsecondform: 'Bottom ',
                      textsecondtext: bottom,
                    ),
                    // Topcontainer(
                    // textfirst: 'Shoulder : ',
                    // textfirstform: 'shoulder ',
                    // textsecond: null,
                    // textsecondform: null,
                    // ),
                    TopsecondContainer(
                      textfirst: 'Shoulder : ',
                      textfirstform: ' shoulder',
                      textfieldtext: shoulder,
                    ),
                    TopsecondContainer(
                      textfirst: 'Front Neck : ',
                      textfirstform: 'Front Neck',
                      textfieldtext: frontneck,
                    ),
                    TopsecondContainer(
                      textfirst: 'Back Neck : ',
                      textfirstform: 'Back Neck',
                      textfieldtext: backneck,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Infocotainer(
            text: 'Bottom Details',
            svg: 'Assets/leggings.svg',
            size: 70,
          ),
          SizedBox(
            height: 20,
          ),
          DetailsContainer(
            height: 0.2,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 15,
                  right: 5,
                ),
                child: Column(
                  children: [
                    Topcontainer(
                      textfirst: 'Hip : ',
                      textfirstform: 'Hip',
                      textfirsttext: hipdown,
                      textsecond: ' Waist : ',
                      textsecondform: 'Waist',
                      textsecondtext: waistdown,
                    ),
                    Topcontainer(
                      textfirst: 'Length : ',
                      textfirstform: 'Length',
                      textfirsttext: lengthdown,
                      textsecond: 'Bottom : ',
                      textsecondform: 'Bottom',
                      textsecondtext: bottomdown,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Infocotainer(
            text: 'Paint',
            svg: 'Assets/leggings.svg',
            size: 70,
          ),
          DetailsContainer(
            height: 0.3,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: imagedata == null
                      ? Container(
                          child: Text('Draw Image'),
                        )
                      : imagedata,
                  // Container(child:image),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) => CanvasPainting(name,phnumber,address),
                        // ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CanvasPainting(
                                address: address,
                                name: name,
                                phnumber: phnumber,
                              ),
                            ));
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue[600],
                        ),
                        child: Center(
                          child: Text(
                            'Draw',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    // onTap: () {
                    // setState(() {
                    // if (imagedata != null) {
                    // image = Image.memory(imagedata);
                    // } else {
                    // return null;
                    // }
                    // });
                    // },
                    // child: Container(
                    // width: 200,
                    // decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(25),
                    // color: Colors.blue[600],
                    // ),
                    // child: Center(
                    // child: Text(
                    // 'refresh',
                    // style: TextStyle(
                    // fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    // ),
                    // ),
                    // ),
                    // ),
                    // ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Infocotainer(
            text: 'Other Requirements',
            svg: 'Assets/top.svg',
            size: 70,
          ),
          SizedBox(
            height: 20,
          ),
          DetailsContainer(
            height: 0.2,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                      onChanged: (val) => description = val,
                      //keyboardType: TextInputType.text,
                      focusNode: descriptionnode,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                )),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset: Offset(3,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                            left: 4,
                                            right: 60,
                                            bottom: 4,
                                          ),
                                          child: SvgPicture.asset(
                                            'Assets/top.svg',
                                            width: 70,
                                          ),
                                        ),
                                        Text(
                                          'Info',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DetailsContainer(
                                  height: 0.34,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Scaffold(
                                      body: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Row(
                                              children: [
                                                Icon(Icons.money_outlined),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Price : ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Center(
                                                  child: Text(
                                                    '₹',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Price',
                                                    ),
                                                    onChanged: (val) => price =
                                                        double.parse(val),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    focusNode: priceNode,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Please Enter valid Amount';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Row(
                                              children: [
                                                Icon(Icons.date_range_outlined),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Today\'s Date : ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Center(
                                                    child: Text(
                                                      DateFormat.yMd()
                                                          .format(initalDate)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Row(
                                              children: [
                                                Icon(Icons.date_range_outlined),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Delivery Date : ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Center(
                                                    child: _selectedDate == null
                                                        ? Text(
                                                            'No Date Choosen!',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.red,
                                                            ),
                                                          )
                                                        : Center(
                                                            child: Text(
                                                              DateFormat.yMd()
                                                                  .format(
                                                                    _selectedDate,
                                                                  )
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 10,
                                                  // top: 10,
                                                  right: 10,
                                                  bottom: 10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text('Pick Date -'),
                                                    SizedBox(width: 8),
                                                    IconButton(
                                                      icon: Icon(
                                                          Icons.date_range),
                                                      color: Colors.blue,
                                                      // iconSize: 100,
                                                      onPressed:
                                                          deliveryDatePicker,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //  ,
                            // ],
                            // ),
                            // ),
                            // ),
                            // ],
                            // ),
                            margin: EdgeInsets.only(
                                bottom: 250, left: 12, right: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                  .animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue[600],
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class RowConatiner extends StatelessWidget {
  final String text;
  final String textform;
  RowConatiner({
    this.text,
    this.textform,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: TextField(
            decoration: InputDecoration(
              hintText: textform,
            ),
          ),
        ),
      ],
    );
  }
}

class TopsecondContainer extends StatelessWidget {
  final String textfirst;
  final String textfirstform;
  double textfieldtext;
  final FocusNode focusnode;
  TopsecondContainer({
    this.textfirst,
    this.textfirstform,
    this.textfieldtext,
    this.focusnode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [
            Text(
              textfirst,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: textfirstform,
                ),
                onChanged: (val) => textfieldtext = double.parse(val),
                focusNode: focusnode,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Topcontainer extends StatelessWidget {
  final String textfirst;
  final String textfirstform;
  double textfirsttext;
  final String textsecond;
  final String textsecondform;
  double textsecondtext;
  FocusNode focusnode;

  Topcontainer({
    this.textfirst,
    this.textfirstform,
    this.textsecond,
    this.textsecondform,
    this.textfirsttext,
    this.textsecondtext,
    this.focusnode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              child: Row(
                children: [
                  Text(
                    textfirst,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: textfirstform,
                      ),
                      onChanged: (val) => textfirsttext = double.parse(val),
                      focusNode: focusnode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textsecond,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: textsecondform,
                      ),
                      onChanged: (val) => textsecondtext = double.parse(val),
                      focusNode: focusnode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Inlinecontainer extends StatelessWidget {
  final String infotext;
  final IconData icon;
  final Widget child;
  Inlinecontainer({
    this.infotext,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            infotext,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            child: child,
            // child: TextField(
            // decoration: InputDecoration(
            // hintText: '     Enter a Person Name',
            // ),
            // )),
            // ),
          ),
        ],
      ),
    );
  }
}

class DetailsContainer extends StatelessWidget {
  final Widget child;
  final double height;
  DetailsContainer({
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: MediaQuery.of(context).size.height * height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      // decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(25),
      // border: Border.all(
      // color: Color(0xFFE5E5E5),
      // ),
      // gradient: LinearGradient(
      // end: Alignment.topRight,
      // begin: Alignment.bottomLeft,
      // colors: [
      // Colors.blue[300],
      // Colors.blue[50],
      // ]),
      // image: DecorationImage(
      // fit: BoxFit.cover,
      // image: AssetImage(
      // 'Assets/Circles.png',
      // ),
      // ),
      // ),
      child: child,
    );
  }
}

class Infocotainer extends StatelessWidget {
  final String text;
  final String svg;
  final double size;
  Infocotainer({
    this.text,
    this.svg,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(3, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 4,
              right: 60,
              bottom: 4,
            ),
            child: SvgPicture.asset(
              svg,
              width: size,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
