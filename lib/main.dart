import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
