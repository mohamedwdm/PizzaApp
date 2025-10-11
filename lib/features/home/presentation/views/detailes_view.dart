import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_view_body.dart';

class DetailesView extends StatelessWidget {
  const DetailesView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(backgroundColor: kPrimaryColor),
      body: const DetailesViewBody(),
    );
  }
}
