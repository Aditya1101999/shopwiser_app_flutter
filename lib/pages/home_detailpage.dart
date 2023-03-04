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
                  AddtoCart(Catalog: catalog!).wh(120,50)
                ],
              ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
            tag: Key(catalog!.id.toString()),
            child: Image.network(catalog!.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog!.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog!.desc.text.textStyle(context.captionStyle).xl.make(),
                      10.heightBox,
                      "Qui enim reprehenderit dolore elit nisi mollit magna tempor sint aliqua tempor. Aliquip irure cillum culpa labore reprehenderit ullamco nisi. Ipsum quis ut tempor ut ipsum velit exercitation mollit ad. Sint dolor sit nisi ex. Veniam sint labore ea ipsum tempor veniam id Lorem est aliquip duis voluptate est. Culpa officia elit elit quis tempor exercitation cupidatat ad. Sint aute nulla ullamco non velit enim dolor ullamco irure amet ut fugiat enim."
                      .text.textStyle(context.captionStyle).make().p16()
                    ],
                  ).py(64),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
