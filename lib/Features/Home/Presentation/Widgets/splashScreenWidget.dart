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

    Timer(Duration(milliseconds: 3000), () {
      BlocProvider.of<HomeBloc>(context).dispatch(GoToHomeEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.04 / 14.5;
    double screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "Assets/Images/logo.jpg",
              height: screenHeight * 250,
              width: screenWidth * 250,
            ),
            SizedBox(height: screenWidth * 50),
            Text(
              "V 0.3.3",
              style: TextStyle(
                fontSize: 32,
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
