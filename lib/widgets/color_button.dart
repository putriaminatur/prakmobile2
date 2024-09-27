import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onTap;

  const ColorButton({
    super.key,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      // ignore: sort_child_properties_last
      child: Text(label),
      onPressed: onTap,
    );
  }
}
