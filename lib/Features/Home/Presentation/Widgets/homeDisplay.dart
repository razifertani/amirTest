import 'package:amirTest/Core/Utils/appColors.dart';
import 'package:amirTest/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dashed_circle/dashed_circle.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: screenHeight * 0.2,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.03,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: screenWidth * 0.03,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return DashedCircle(
                child: Padding(
                  padding: EdgeInsets.all(
                    screenWidth * 0.02,
                  ),
                  child: CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: NetworkImage(
                      'https://www.lwb.org.au/services/child-youth-and-family/static/b5cca79df7320248a77f6655a278190f/a6c62/img-index-banner.jpg',
                    ),
                  ),
                ),
                color: Colors.deepOrangeAccent,
              );
            },
          ),
          // child: Row(
          //   children: [
          //     DashedCircle(
          //       child: Padding(
          //         padding: EdgeInsets.all(
          //           screenWidth * 0.02,
          //         ),
          //         child: CircleAvatar(
          //           radius: screenWidth * 0.1,
          //           backgroundImage: NetworkImage(
          //             'https://www.lwb.org.au/services/child-youth-and-family/static/b5cca79df7320248a77f6655a278190f/a6c62/img-index-banner.jpg',
          //           ),
          //         ),
          //       ),
          //       color: Colors.deepOrangeAccent,
          //     ),
          //     DashedCircle(
          //       child: Padding(
          //         padding: EdgeInsets.all(
          //           screenWidth * 0.02,
          //         ),
          //         child: CircleAvatar(
          //           radius: screenWidth * 0.1,
          //           backgroundImage: NetworkImage(
          //             'https://www.lwb.org.au/services/child-youth-and-family/static/b5cca79df7320248a77f6655a278190f/a6c62/img-index-banner.jpg',
          //           ),
          //         ),
          //       ),
          //       color: Colors.deepOrangeAccent,
          //     )
          //   ],
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.child_care_outlined,
          color: Colors.white,
          size: 34,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.person_outlined,
          Icons.notifications_outlined,
          Icons.message_outlined,
          Icons.settings_outlined,
        ],
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.grey[600],
        gapLocation: GapLocation.center,
        iconSize: 28,
        activeIndex: 4,
        onTap: (index) {},
      ),
    );
  }
}
