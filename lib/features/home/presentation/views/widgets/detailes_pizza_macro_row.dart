import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_macro_widget.dart';

class DetailesPizzaMacroRow extends StatelessWidget {
  const DetailesPizzaMacroRow({super.key, required this.macros});

  final MacroModel macros;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DetailesMacroWidget(
          value: macros.calories,
          title: 'Calories',
          icon: FontAwesomeIcons.fire,
        ),
        const SizedBox(width: 5),
        DetailesMacroWidget(
          value: macros.protein,
          title: 'Protein',
          icon: FontAwesomeIcons.dumbbell,
        ),
        const SizedBox(width: 5),
        DetailesMacroWidget(
          value: macros.fat,
          title: 'Fat',
          icon: FontAwesomeIcons.oilWell,
        ),
        const SizedBox(width: 5),
        DetailesMacroWidget(
          value: macros.carbs,
          title: 'Carb',
          icon: FontAwesomeIcons.breadSlice,
        ),
      ],
    );
  }
}
