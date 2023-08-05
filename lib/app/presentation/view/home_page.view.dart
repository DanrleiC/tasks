import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/app/presentation/controller/home_page.controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  
  final _homePageController = HomePageController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _floatingActionButtonAdd,
    );
  }

  AppBar get _appBar => AppBar(
    title: const Text('Tasks Top'),
    centerTitle: true,
    elevation: 35,
  );

  Widget get _floatingActionButtonAdd => FloatingActionButton(
    onPressed:() => _homePageController.navegaAdd(context),
    child: const Icon(FontAwesomeIcons.plus),
  );

}