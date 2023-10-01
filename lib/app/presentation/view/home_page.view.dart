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
  bool isSelected = false;

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
    actions: isSelected? _actions : [],
  );

  List<Widget> get _actions => [
    IconButton(
      onPressed: (){
        _homePageController.deleteAllTask;
        loadData();
        setState(() {
          isSelected = false;
        });
      }, 
      icon: const Icon(FontAwesomeIcons.trash)
    )
  ];

  Widget get _floatingActionButtonAdd => FloatingActionButton(
    onPressed:() => _homePageController.navegaAdd(ctx:context),
    child: const Icon(FontAwesomeIcons.plus),
  );

  Widget get _content {
    return ValueListenableBuilder(
      valueListenable: allList,
      builder: (context, value, child) => ListView.builder(
        itemCount: allList.value.length,
        itemBuilder: (context, index) => _card(index),
      ),
    );
  }

  Widget _card(int idx) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onLongPress: () => setState(() {
          isSelected = true;
        }),
        onTap: () => _homePageController.navegaDescription(ctx: context, task: allList.value[idx]),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardContent(title: allList.value[idx].title!),
                _containerJoin(idx: idx)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerJoin({required int  idx}) {
    return Row(
      children: [
        _edit(editTask: allList.value[idx]),
        _trash(id: allList.value[idx].id!)
      ],
    );
  }

  Widget _edit({required TaskModel editTask}){
    return IconButton(
      onPressed: () =>  _homePageController.navegaAdd(ctx: context, task: editTask), 
      icon: const Icon(FontAwesomeIcons.penToSquare)
    );
  }

  Widget _trash({required int id}){
    return IconButton(
      onPressed: () { 
        _homePageController.deleteTask(id: id);
        loadData();
      }, 
      icon: const Icon(FontAwesomeIcons.trash)
    );
  }

  Widget _cardContent({required String title}){
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
      ),
    );
  }

}