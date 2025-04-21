import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onSubmitted;

  const CustomTextField({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search for a location...',
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
