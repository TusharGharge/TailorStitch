import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:tailorstitch/Provider/data.dart';
import 'package:tailorstitch/Provider/dataProvider.dart';
import 'package:tailorstitch/Screens/measurescreen.dart';
import 'package:tailorstitch/Screens/paint.dart';

class MainPage extends StatefulWidget {
  static const String idScreen = '/mainPage';
  final String name, id, address;
  final int phnumber;
  MainPage({this.address, this.id, this.name, this.phnumber});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _formKey = GlobalKey<FormState>();
  // final DateTime date = DateTime.now();
  // final _clientnameFocusNode = FocusNode();
  // final _phonumberFocusNode = FocusNode();
  // final _addressFocusNode = FocusNode();

  String name = '';
  int phnumber = 0;
  String id = randomString(10);
  String address = '';
  void save() {
    // Provider.of<DataProvider>(context, listen: false)
    // .addProducts(id, phnumber, address, name);
    print(name);
    Navigator.of(context).pushNamed(
      MeasureScreen.idScreen,
      arguments: id,
    );
  }

  
  // void addNewClient(BuildContext ctx)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New Client'),
        icon: Icon(Icons.person_outline),
        onPressed: () {
          Navigator.of(context).pushNamed(MeasureScreen.idScreen);
        },
      ),
      body: RaisedButton(
          child: Center(child: Text('next')),
          onPressed: () {
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
          }),
    );
  }
}
// showModalBottomSheet(
// context: context,
// enableDrag: true,
// isScrollControlled: true,
// barrierColor: Colors.transparent,
// background color for modal bottom screen
// backgroundColor: Colors.yellow,
// elevates modal bottom screen
// elevation: 10,
// gives rounded corner to modal bottom screen
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(40.0),
// ),
// builder: (BuildContext context) {
// return Container(
// height: MediaQuery.of(context).size.height * 0.5 +
// MediaQuery.of(context).viewInsets.bottom,
// color: Colors.amber,
// child: Padding(
// padding: const EdgeInsets.all(15.0),
// child: Column(
// children: [
// Container(
// child: Form(
// key: _formKey,
// child: Column(
// children: [
// Text(
// 'Client Details',
// style: TextStyle(
// fontSize: 30,
// color: Colors.black,
// fontWeight: FontWeight.bold),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 10,
// left: 20,
// right: 20,
// ),
// ),
// TextFormField(
// decoration: InputDecoration(
// labelText: 'Client Name',
// ),
// keyboardType: TextInputType.text,
// textInputAction: TextInputAction.next,
// onFieldSubmitted: (_) {
// FocusScope.of(context)
// .requestFocus(_phonumberFocusNode);
// },
// validator: (value) {
// if (value.isEmpty) {
// return 'Please Provide a value';
// }
// return null;
// },
// onChanged: (value) =>
// setState(() => name = value),
// onSaved: (value) {
// _editValueProduct = Data(
// name: value,
// address: _editValueProduct.address,
// id: _editValueProduct.id,
// phnumber: _editValueProduct.phnumber,
// date: _editValueProduct.date,
// );
// },
// ),
// SizedBox(height: 8),
// TextFormField(
// decoration: InputDecoration(
// labelText: 'Phone Number',
// ),
// keyboardType: TextInputType.number,
// textInputAction: TextInputAction.next,
// focusNode: _phonumberFocusNode,
// onFieldSubmitted: (_) {
// FocusScope.of(context)
// .requestFocus(_addressFocusNode);
// },
// validator: (value) {
// if (value.isEmpty || value.length <= 10) {
// return 'Please Enter valid Phone Number';
// }
// return null;
// },
// onChanged: (value) =>
// setState(() => phnumber = int.parse(value)),
// onSaved: (value) {
// _editValueProduct = Data(
// name: _editValueProduct.name,
// address: _editValueProduct.address,
// id: _editValueProduct.id,
// phnumber: int.parse(value),
// date: _editValueProduct.date,
// );
// },
// ),
// SizedBox(height: 8),
// TextFormField(
// minLines: 3,
// decoration: InputDecoration(
// labelText: 'Address',
// ),
// keyboardType: TextInputType.text,
// autofocus: false,
// textInputAction: TextInputAction.next,
// focusNode: _addressFocusNode,
// validator: (value) {
// if (value.isEmpty) {
// return 'Please Enter valid Address';
// }
// return null;
// },
// onChanged: (value) =>
// setState(() => address = value),
// onSaved: (value) {
// _editValueProduct = Data(
// name: _editValueProduct.name,
// address: value,
// id: _editValueProduct.id,
// phnumber: _editValueProduct.phnumber,
// date: _editValueProduct.date,
// );
// ),
// SizedBox(height: 30),
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: RaisedButton(
// padding: EdgeInsets.all(10.0),
// child: Text(
// ' Measurments ',
// style: TextStyle(
// fontSize: 10,
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// onPressed: save,
// ),
// )
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// );
// },
// );
