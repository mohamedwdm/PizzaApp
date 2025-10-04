import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_macro_widget.dart';

class DetailesPizzaMacroRow extends StatelessWidget {
  const DetailesPizzaMacroRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DetailesMacroWidget(
          value: 25,
          title: 'Calories',
          icon: FontAwesomeIcons.fire,
        ),
        SizedBox(width: 5),
        DetailesMacroWidget(
          value: 25,
          title: 'Protein',
          icon: FontAwesomeIcons.dumbbell,
        ),
        SizedBox(width: 5),
        DetailesMacroWidget(
          value: 20,
          title: 'Fat',
          icon: FontAwesomeIcons.oilWell,
        ),
        SizedBox(width: 5),
        DetailesMacroWidget(
          value: 265,
          title: 'Carb',
          icon: FontAwesomeIcons.breadSlice,
        ),
      ],
    );
  }
}
