import 'package:flutter/material.dart';
import './pages/index_page.dart';
import './common/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'vpai',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: IndexPage(),
        routes: RouterConfig().getRouterMap(),
      ),
    );
    
  }
}

