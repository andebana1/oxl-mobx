import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  PageTile({this.label, this.iconData, this.onTap, this.highlighted});

  Color _setColor(){
    return highlighted ? Colors.purple : Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: _setColor()
          ),
      ),
      leading: Icon(
          iconData,
          color: _setColor(),
      ),
      onTap: onTap,
    );
  }

}
