import 'package:amirTest/Core/Utils/appColors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:toast/toast.dart';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({Key key}) : super(key: key);

  @override
  _HomeDisplayState createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  List<String> childrenNames = ['Zouhaier', 'Amir', 'Razi'];
  List<String> childrenGender = ['Boy', 'Boy', 'Boy'];
  String dateOfBirth = '';
  String name = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.indigo[500],
                Colors.blue[900],
              ],
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.025,
            vertical: screenHeight * 0.022,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.2,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: childrenNames.length + 1,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: screenWidth * 0.02,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              if (index == childrenNames.length) {
                                slideDialog.showSlideDialog(
                                  context: context,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.02,
                                        ),
                                        child: Text(
                                          "Add Child",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.065,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.person,
                                          color: AppColors.primaryColor,
                                        ),
                                        title: TextField(
                                          decoration: InputDecoration(
                                            hintText: "Name of the child",
                                          ),
                                          onChanged: (value) {
                                            name = value;
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.phone,
                                          color: AppColors.primaryColor,
                                        ),
                                        title: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Emergency Phone",
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.child_care,
                                          color: AppColors.primaryColor,
                                        ),
                                        title: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Age",
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          DatePicker.showDatePicker(
                                            context,
                                            minTime: DateTime(2000, 01, 01),
                                            maxTime: DateTime(2020),
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.fr,
                                            onConfirm: (date) {
                                              dateOfBirth = date
                                                  .toString()
                                                  .substring(0, 11);

                                              Toast.show(
                                                'Date of birth is set to: ' +
                                                    dateOfBirth,
                                                context,
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                textColor: Colors.white,
                                                duration: 5,
                                                gravity: Toast.BOTTOM,
                                              );
                                            },
                                          );
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.today,
                                            color: AppColors.primaryColor,
                                          ),
                                          title: Text('Date Of Birth'),
                                          subtitle: Text(dateOfBirth),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.calendar_today,
                                          color: AppColors.primaryColor,
                                        ),
                                        title: DropdownButton<String>(
                                          isDense: true,
                                          elevation: 10,
                                          hint: Text('Gender'),
                                          isExpanded: true,
                                          items: <String>['Boy', 'Girl']
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            gender = value;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.05,
                                        ),
                                        child: ButtonTheme(
                                          height: screenHeight * 0.06,
                                          minWidth: screenWidth * 0.8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: RaisedButton(
                                            color: AppColors.primaryColor,
                                            child: Text(
                                              'Add Child',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                childrenNames.add(name);
                                                childrenGender.add(gender);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  pillColor: AppColors.primaryColor,
                                  backgroundColor: Colors.white,
                                );
                              }
                            },
                            elevation: 10.0,
                            fillColor: AppColors.primaryColor,
                            shape: CircleBorder(
                              side: BorderSide(
                                color: AppColors.primaryColor,
                                width: 3,
                              ),
                            ),
                            child: index == childrenNames.length
                                ? Icon(
                                    Icons.add,
                                    size: screenWidth * 0.21,
                                    color: Colors.white,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 42,
                                        backgroundImage: NetworkImage(
                                          index == 0
                                              ? 'https://raisingchildren.net.au/__data/assets/image/0015/50046/using-time-out-to-guide-your-childs-behaviournarrow.jpg'
                                              : index == 1
                                                  ? 'https://nurtureandthriveblog.com/wp-content/uploads/2018/10/how-to-help-your-kid-wake-up-happy-3-scaled.jpeg'
                                                  : index == 2
                                                      ? 'https://cdn.shopify.com/s/files/1/0278/7639/3021/products/Masque-kid-security_947x.png?v=1599154984'
                                                      : childrenGender[index] ==
                                                              'Boy'
                                                          ? 'https://cdn1.iconfinder.com/data/icons/children-avatar-flat/128/children_avatar-01-512.png'
                                                          : childrenGender[
                                                                      index] ==
                                                                  'Girl'
                                                              ? 'https://cdn1.iconfinder.com/data/icons/children-avatar-flat/128/children_avatar-13-512.png'
                                                              : 'https://cdn1.iconfinder.com/data/icons/children-avatar-flat/128/children_avatar-01-512.png',
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          Text(
                            index == childrenNames.length
                                ? ''
                                : childrenNames[index],
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Events',
                      style: TextStyle(
                        fontSize: screenWidth * 0.075,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All >',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.008,
                ),
                Container(
                  height: screenHeight * 0.24,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: screenWidth * 0.84,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: Container(
                            width: screenWidth * 0.82,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.80,
                                  height: screenHeight * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        index == 0
                                            ? 'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/06/kid-bedtime-pajamas-bed-1296x728-header.jpg?w=1155&h=1528'
                                            : index == 1
                                                ? 'https://media2.s-nbcnews.com/i/newscms/2020_39/1611490/kids-face-masks-kr-2x1-tease-200921_703d41cc9c7264ba67f0f0fd4cd78688.jpg'
                                                : index == 2
                                                    ? 'https://cdn.bangkokhospital.com/2020/04/IHL-Power-of-Kids-ดูแลทุกย่างก้าวของเจ้าตัวเล็ก.jpg'
                                                    : 'https://cms-tc.pbskids.org/parents/expert-tips-and-advice/how-to-teach-frustration-tolerance-to-kids-hero.jpg?mtime=20181008030129',
                                      ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.30),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        index == 0
                                            ? 'Kids Park Event'
                                            : index == 1
                                                ? 'Summer Kids Event'
                                                : index == 2
                                                    ? 'Singing Dancing !'
                                                    : 'Football Match U-8',
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        index == 0
                                            ? 'Join Us 19 January at 9 PM'
                                            : index == 1
                                                ? 'Buy A Ticket Now !'
                                                : index == 2
                                                    ? 'What are you waiting for ?'
                                                    : '5 x 5 Match',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: screenWidth * 0.075,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All >',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.008,
                ),
                Container(
                  height: screenHeight * 0.24,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: screenWidth * 0.84,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: Container(
                            width: screenWidth * 0.82,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth * 0.80,
                                  height: screenHeight * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        index == 0
                                            ? 'https://cdn.bangkokhospital.com/2020/04/IHL-Power-of-Kids-ดูแลทุกย่างก้าวของเจ้าตัวเล็ก.jpg'
                                            : index == 1
                                                ? 'https://cms-tc.pbskids.org/parents/expert-tips-and-advice/how-to-teach-frustration-tolerance-to-kids-hero.jpg?mtime=20181008030129'
                                                : index == 2
                                                    ? 'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/06/kid-bedtime-pajamas-bed-1296x728-header.jpg?w=1155&h=1528'
                                                    : 'https://media2.s-nbcnews.com/i/newscms/2020_39/1611490/kids-face-masks-kr-2x1-tease-200921_703d41cc9c7264ba67f0f0fd4cd78688.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.30),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        index == 0
                                            ? 'Kids Park Event'
                                            : index == 1
                                                ? 'Summer Kids Event'
                                                : index == 2
                                                    ? 'Singing Dancing !'
                                                    : 'Football Match U-8',
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        index == 0
                                            ? 'Join Us 19 January at 9 PM'
                                            : index == 1
                                                ? 'Buy A Ticket Now !'
                                                : index == 2
                                                    ? 'What are you waiting for ?'
                                                    : '5 x 5 Match',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.child_care_outlined,
          color: Colors.white,
          size: 37,
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
        backgroundColor: AppColors.primaryColor,
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.white,
        gapLocation: GapLocation.center,
        iconSize: 28,
        activeIndex: 4,
        onTap: (index) {},
      ),
    );
  }
}
