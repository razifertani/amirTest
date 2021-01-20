import 'dart:async';

import 'package:amirTest/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:amirTest/Core/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenDisplay extends StatefulWidget {
  const SplashScreenDisplay({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenDisplayState createState() => _SplashScreenDisplayState();
}

class _SplashScreenDisplayState extends State<SplashScreenDisplay> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 000), () {
      BlocProvider.of<HomeBloc>(context).dispatch(GoToHomeEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Image.asset(
              "Assets/Images/logo.jpg",
              height: screenHeight * 0.75,
              width: screenWidth * 0.75,
            ),
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Text(
              "V 0.0.1",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
