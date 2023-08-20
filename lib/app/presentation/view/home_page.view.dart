import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/app/data/model/task.model.dart';
import 'package:tasks/app/presentation/controller/home_page.controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  
  final _homePageController = HomePageController();
  ValueNotifier<List<TaskModel>> allList = ValueNotifier([]);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    allList.value = await _homePageController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _floatingActionButtonAdd,
      body: _content,
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

  Widget get _content {
    return ValueListenableBuilder(
      valueListenable: allList,
      builder: (context, value, child) => ListView.builder(
        itemCount: allList.value.length,
        itemBuilder: (context, index) => _container(index),
      ),
    );
  }

  Widget _container(int idx) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.teal,
        child: Column(
          children: [
            Text(allList.value[idx].title!),
            Text(allList.value[idx].description!),
          ],
        ),
      ),
    );
  }

}