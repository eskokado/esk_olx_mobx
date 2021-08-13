﻿import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  PageTile({
    required this.label, 
    required this.iconData, 
    required this.onTap, 
    required this.highlighted
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: highlighted ? Colors.purple : Colors.black54
        ),
      ),
      leading: Icon(
        iconData, 
        color: highlighted ? Colors.purple : Colors.black54
      ),
      onTap: onTap,
    );
  }
}
