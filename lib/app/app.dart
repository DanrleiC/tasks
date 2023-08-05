import 'package:flutter/material.dart';

import 'presentation/view/home_page.view.dart';

class App extends StatelessWidget {
  const App({super.key});
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePageView(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}