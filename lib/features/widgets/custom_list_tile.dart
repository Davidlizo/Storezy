import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final VoidCallback onPressed;
  const CustomListTile({
    super.key, required this.leading, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      onTap: onPressed,
    );
  }
}