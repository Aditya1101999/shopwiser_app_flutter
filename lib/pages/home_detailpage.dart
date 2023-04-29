import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_1/widgets/home_widgets/AddtoCart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/items.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../utils/routes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item? catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  Future<List<Item>> _getRecommendations() async {
    final String url = "https://jainvaibhav671.pythonanywhere.com/recommendations/${catalog!.id}/3";
    print(url);
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url), headers: headers);
    var data = json.decode(response.body);
    Item item = Model.catModel.getByID(data["data"][0]);
    List<Item> res = List.from(data["data"])
        .map<Item>((id) => Model.catModel.getByID(id))
        .toList();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("ShopWiser", textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Roboto")),
        centerTitle: true,
        actions: <Widget>[
      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        style: ButtonStyle(
        // ignore: deprecated_member_use
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder())
        ),
        child: const Icon(CupertinoIcons.cart)
      )],
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog!.price}".text.bold.xl4.pink800.make(),
            AddtoCart(Catalog: catalog!).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: Key(catalog!.id.toString()),
                child: Image.network(catalog!.image),
              ).h32(context),
              VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      catalog!.name.text.xl4
                          .color(context.accentColor)
                          .center
                          .bold
                          .make(),
                    RatingBarIndicator(
                      rating: catalog!.rating.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                      10.heightBox,
                      "Qui enim reprehenderit dolore elit nisi mollit magna tempor sint aliqua tempor. Aliquip irure cillum culpa labore reprehenderit ullamco nisi. Ipsum quis ut tempor ut ipsum velit exercitation mollit ad. Sint dolor sit nisi ex. Veniam sint labore ea ipsum tempor veniam id Lorem est aliquip duis voluptate est. Culpa officia elit elit quis tempor exercitation cupidatat ad. Sint aute nulla ullamco non velit enim dolor ullamco irure amet ut fugiat enim."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                      "Features"
                          .text
                          .bold
                          .center
                          .xl2
                          .color(context.accentColor)
                          .make()
                          .p16(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text("Feature")),
                            DataColumn(label: Text("Value")),
                          ],
                          rows:[
                            DataRow(cells:[
                              const DataCell(Text("Processor", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(catalog!.processor))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text("Graphics Card", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(catalog!.graphicsCard))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text("Display Size", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text("${catalog!.displaySize} inch"))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text("Disk Type", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(catalog!.diskType))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text("Disk Size", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text("${catalog!.diskSpace} GB"))
                            ]),
                          ]
                        ),
                      ).p16(),
                      "Comparison Table".text.bold.xl2.color(context.accentColor).make().p16(),
                  _comparisionTable(),
//comment the above code and use the code below when images insertion required->From line 89
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         DataTable(
//           columns: [
//             DataColumn(label: Text("Feature")),
//             DataColumn(label: Text("Product 1")),
//             DataColumn(label: Text("Product 2")),
//             DataColumn(label: Text("Product 3")),
//             DataColumn(label: Text("Product 4")),
//             DataColumn(label: Text("Product 5")),
//           ],
//           rows: List.generate(
//             10,
//             (index) => DataRow(
//               cells: [
//                 DataCell(Text("Feature ${index+1}")),
//                 DataCell(Column(
//                   children: [
//                     Image.network('https://example.com/product1.jpg', width: 50, height: 50),
//                     Text("\$ ${(index+1)*10}"),
//                   ],
//                 )),
//                 DataCell(Column(
//                   children: [
//                     Image.network('https://example.com/product2.jpg', width: 50, height: 50),
//                     Text("\$ ${(index+1)*20}"),
//                   ],
//                 )),
//                 DataCell(Column(
//                   children: [
//                     Image.network('https://example.com/product3.jpg', width: 50, height: 50),
//                     Text("\$ ${(index+1)*30}"),
//                   ],
//                 )),
//                 DataCell(Column(
//                   children: [
//                     Image.network('https://example.com/product4.jpg', width: 50, height: 50),
//                     Text("\$ ${(index+1)*40}"),
//                   ],
//                 )),
//                 DataCell(Column(
//                   children: [
//                     Image.network('https://example.com/product5.jpg', width: 50, height: 50),
//                     Text("\$ ${(index+1)*50}"),
//                   ],
//                 )),
//               ],
//             ),
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             columns: [
//               DataColumn(label: Text("Product")),
//               DataColumn(label: Text("Image")),
//               DataColumn(label: Text("Price")),
//               DataColumn(label: Text("Rating")),
//               DataColumn(label: Text("Warranty")),
//               DataColumn(label: Text("Color")),
//             ],
//             rows: List.generate(
//               5,
//               (index) => DataRow(
//                 cells: [
//                   DataCell(Text("Product ${index+1}")),
//                   DataCell(Image.network('https://example.com/product${index+1}.jpg', width: 50, height: 50)),
//                   DataCell(Text("\$ ${(index+1)*10}")),
//                   DataCell(Text("${(index+1)*2} stars")),
//                   DataCell(Text("${(index+1)*3} months")),
//                   DataCell(Container(width: 24, height: 24, color: Colors.primaries[index])),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ).p16(),

                    ],
                  ).py64(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _comparisionTable() => FutureBuilder<List<Item>>(
      future: _getRecommendations(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var recommendations = snapshot.data;
          print("Snapshot has Data");
          print(snapshot.data);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                      headingRowHeight: 170,
                      columns: [
                        DataColumn(label: InkWell(
                            child:Column(
                            children: [
                              Image.network(catalog!.image, width: 100, height: 100),
                              Text("\$${catalog!.price}", style: TextStyle(color: Vx.pink800)),
                              SizedBox(
                                  width: 120,
                                  child: Text(catalog!.name, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis))
                            ]),

                        )
                        ),
                        DataColumn(label: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => HomeDetailPage(catalog: recommendations![1]))),
                            child:Column(
                            children: [
                              Image.network(recommendations![1].image, width: 100, height: 100),
                              Text("\$${recommendations![1].price}", style: TextStyle(color: Vx.pink800)),
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![1].name, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis))
                            ])
                          )
                        ),
                        DataColumn(label: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeDetailPage(catalog: recommendations![2]))),
                            child:Column(
                            children: [
                              Image.network(recommendations![2].image, width: 100, height: 100),
                              Text("\$${recommendations![2].price}", style: TextStyle(color: Vx.pink800)),
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![2].name, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis))
                            ])
                          )
                        ),
                      ],
                      rows: [
                        DataRow(color: MaterialStateColor.resolveWith((states) => Colors.black26),
                            cells: const [
                              DataCell(Text("Processor Name")),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink())
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(catalog!.processor))
                          ),
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![1].processor))
                          ),
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![2].processor))
                          )
                        ]),
                        DataRow(color: MaterialStateColor.resolveWith((states) => Colors.black26),
                            cells: const [
                              DataCell(Text("Graphics Card")),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink())
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(catalog!.graphicsCard))
                          ),
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![1].graphicsCard))
                          ),
                          DataCell(
                              SizedBox(
                                  width: 120,
                                  child: Text(recommendations![2].graphicsCard))
                          ),
                        ]),
                        DataRow(color: MaterialStateColor.resolveWith((states) => Colors.black26),
                            cells: const [
                              DataCell(Text("Screen Size")),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink())
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("${catalog!.displaySize} inch")),
                          DataCell(Text("${recommendations![1].displaySize} inch")),
                          DataCell(Text("${recommendations![2].displaySize} inch")),
                        ]),
                        DataRow(color: MaterialStateColor.resolveWith((states) => Colors.black26),
                            cells: const [
                              DataCell(Text("Disk Size")),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink())
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(Text("${catalog!.diskSpace} GB")),
                          DataCell(Text("${recommendations![1].diskSpace} GB")),
                          DataCell(Text("${recommendations![2].diskSpace} GB")),
                        ]),
                        DataRow(color: MaterialStateColor.resolveWith((states) => Colors.black26),
                            cells: const [
                              DataCell(Text("Disk Type")),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink())
                            ]
                        ),
                        DataRow(cells: [
                          DataCell(Text(catalog!.diskType)),
                          DataCell(Text(recommendations![1].diskType)),
                          DataCell(Text(recommendations![2].diskType)),
                        ]),
                      ]
                  ),
                ],
              ),
            ),
          ).p16();
        }
        return const CircularProgressIndicator();
      },
  );
}
