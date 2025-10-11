import 'package:flutter/material.dart';

class DetailesPizzaImageCard extends StatelessWidget {
  const DetailesPizzaImageCard({super.key, required this.imageLink});
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        image:  DecorationImage(image: NetworkImage(imageLink)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            color: Colors.grey.shade300,
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
