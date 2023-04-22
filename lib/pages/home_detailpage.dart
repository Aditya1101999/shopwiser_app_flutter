import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/AddtoCart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/items.dart';
class HomeDetailPage extends StatelessWidget {
  final Item? catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                          .bold
                          .make(),
                      catalog!.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Qui enim reprehenderit dolore elit nisi mollit magna tempor sint aliqua tempor. Aliquip irure cillum culpa labore reprehenderit ullamco nisi. Ipsum quis ut tempor ut ipsum velit exercitation mollit ad. Sint dolor sit nisi ex. Veniam sint labore ea ipsum tempor veniam id Lorem est aliquip duis voluptate est. Culpa officia elit elit quis tempor exercitation cupidatat ad. Sint aute nulla ullamco non velit enim dolor ullamco irure amet ut fugiat enim."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                      "Features"
                          .text
                          .bold
                          .xl2
                          .color(context.accentColor)
                          .make()
                          .p16(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text("Feature")),
                            DataColumn(label: Text("Value")),
                          ],
                          rows: List.generate(
                            10,
                            (index) => DataRow(
                              cells: [
                                DataCell(Text("Feature ${index + 1}")),
                                DataCell(Text("Value ${index + 1}")),
                              ],
                            ),
                          ),
                        ),
                      ).p16(),
                      "Comparison Table".text.bold.xl2.color(context.accentColor).make().p16(),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTable(
          columns: [
            DataColumn(label: Text("Feature")),
            DataColumn(label: Text("Product 1")),
            DataColumn(label: Text("Product 2")),
            DataColumn(label: Text("Product 3")),
            DataColumn(label: Text("Product 4")),
            DataColumn(label: Text("Product 5")),
          ],
          rows: List.generate(
            10,
            (index) => DataRow(
              cells: [
                DataCell(Text("Feature ${index+1}")),
                DataCell(Text("\$ ${(index+1)*10}")),
                DataCell(Text("\$ ${(index+1)*20}")),
                DataCell(Text("\$ ${(index+1)*30}")),
                DataCell(Text("\$ ${(index+1)*40}")),
                DataCell(Text("\$ ${(index+1)*50}")),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text("Product")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Rating")),
              DataColumn(label: Text("Warranty")),
              DataColumn(label: Text("Color")),
            ],
            rows: List.generate(
              5,
              (index) => DataRow(
                cells: [
                  DataCell(Text("Product ${index+1}")),
                  DataCell(Text("\$ ${(index+1)*10}")),
                  DataCell(Text("${(index+1)*2} stars")),
                  DataCell(Text("${(index+1)*3} months")),
                  DataCell(Container(width: 24, height: 24, color: Colors.primaries[index])),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
).p16(),
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
}
