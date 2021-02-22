import 'package:flutter/material.dart';
import 'package:flutter_app/screens/create/create_screen.dart';
import 'package:flutter_app/screens/home/home_screen.dart';
import 'package:flutter_app/stores/page_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController pageController = new PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    reaction(
            (_) => pageStore.page,
            (page) => pageController.jumpToPage(page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
