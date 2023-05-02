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
  List<Item>? _items;
  final TextEditingController _searchController = TextEditingController();
  bool searchToggle = false;

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
    _items = Model.items;
    setState(() {});
  }

  Future<List<Item> ?> loadSearchResults(String searchString) async {
    if(searchString.isEmptyOrNull) return Model.items;

    const String url = "https://jainvaibhav671.pythonanywhere.com/search";
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'query': searchString});
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    var data = json.decode(response.body);
    List<Item> res = List.from(data["data"])
        .map<Item>((id) => Model.catModel.getByPos(id))
        .toList();

    return res;
  }

  void doSearch(String? query) {
    if(query.isEmptyOrNull) return;

    searchToggle = true;

    _items = null;
    setState((){});
    loadSearchResults(query!).then((List<Item>? items){
      print(items);
      _items = items;
      setState(() {});
    }).catchError((e){
      print("Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: "Search...",
          ),
          controller: _searchController,
          onSubmitted: (String? query) {
            doSearch(query);
          },
        ),
        actions: [
        IconButton(
          onPressed: () {
            if(searchToggle) {
              searchToggle = !searchToggle;
              _items = Model.items;
              _searchController.clear();
              setState(() {});
            } else {
              doSearch(_searchController.text);
            }
          },
          icon: Icon(searchToggle ? CupertinoIcons.clear : CupertinoIcons.search),
        )
      ]
      ),
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
              if (_items != null && _items!.isNotEmpty)
                ModelList(items: _items).py16().expand()
              else if (_items != null && _items!.isEmpty)
                "Not found.".text.xl2.make().centered().expand()
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
