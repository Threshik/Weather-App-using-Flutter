import 'package:flutter/material.dart';
class additionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const additionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });
  
  @override
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

