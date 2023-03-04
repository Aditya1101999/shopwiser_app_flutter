import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detailpage.dart';
import 'package:flutter_application_1/widgets/home_widgets/ItemImage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/items.dart';
import 'AddtoCart.dart';

class ModelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
    ? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
      ,crossAxisSpacing: 20),
      shrinkWrap: true,
      itemCount: Model.items?.length,
      itemBuilder: (context, index) {
        final catalog = Model.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: catalogItem(catalog: catalog));
      },
    ):
    ListView.builder(
      shrinkWrap: true,
      itemCount: Model.items?.length,
      itemBuilder: (context, index) {
        final catalog = Model.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: catalogItem(catalog: catalog));
      },
    );
  }
}

class catalogItem extends StatelessWidget {
  final Item catalog;

  const catalogItem({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    var children2 = [
        Hero(
            tag: Key(catalog.id.toString()),
            child: ItemImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            catalog.name.text.xl.color(context.theme.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddtoCart(Catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0:16)
        )
      ];
    return VxBox(
        child: context.isMobile? Row(
      children: children2,
    ):Column(
      children: children2,
    )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

