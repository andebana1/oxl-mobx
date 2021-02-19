import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(

        ),
      ),
    );
  }
}
