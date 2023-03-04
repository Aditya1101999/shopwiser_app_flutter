import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class KartHeader extends StatelessWidget {
  const KartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Kart".text.xl5.bold.color(context.theme.accentColor).make(),
        "What's New. . .".text.xl2.make(),
      ],
    );
  }
}
