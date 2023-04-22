import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/models/items.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/cart.dart';
import '../widgets/item_widget.dart';
import '../widgets/home_widgets/KartHeader.dart';
import '../widgets/home_widgets/ModelList.dart';
import '../firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadDataBase() async {
    final String url = "https://jainvaibhav671.pythonanywhere.com/";
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url), headers: headers);
    print(response.body);

    return json.decode(response.body);

    // FirebaseDatabase database = FirebaseDatabase.instance;
    // final ref = database.ref();
    // final snapshot = await ref.get();
    // if (snapshot.exists) {
    //   print(snapshot.value);
    // } else {
    //   print('No data available.');
    // }
    // return snapshot.value;
  }

  loadData() async {
    final products = await loadDataBase();
    var productsData = products["data"];
    Model.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        // ignore: deprecated_member_use
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KartHeader(),
              if (Model.items != null && Model.items!.isNotEmpty)
                ModelList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
