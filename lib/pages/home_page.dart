import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: 
         const Center(child: Text("Türkiye Haberleri",style: TextStyle(color: Colors.black),)),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const NewsListView(),
      ),
    );
  }
}
