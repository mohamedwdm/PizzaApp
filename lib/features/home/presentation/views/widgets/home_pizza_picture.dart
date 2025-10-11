import 'package:flutter/material.dart';

class HomePizzaPicture extends StatelessWidget {
  const HomePizzaPicture({super.key, required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageLink,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child; // image loaded ✅

        // while loading, show progress indicator that fits available space
        return AspectRatio(
          aspectRatio: 0.95, // optional – keeps layout stable
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
                strokeWidth: 2,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
