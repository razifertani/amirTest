import 'package:amirTest/Core/Utils/appColors.dart';
import 'package:amirTest/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({Key key}) : super(key: key);

  @override
  _HomeDisplayState createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: Text("AMIR TEST"),
        ),
      ),
    );
  }
}
