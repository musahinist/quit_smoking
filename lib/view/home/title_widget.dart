import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {Key? key,
      required this.title,
      this.icon = Icons.arrow_forward_ios,
      this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: onTap, icon: Icon(icon, size: 16))
        ],
      ),
    );
  }
}
