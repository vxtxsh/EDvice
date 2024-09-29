import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/const.dart';
import '../widgets/card_courses.dart';
import '../widgets/header.dart';
import 'bottom.dart';
import 'category_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchControl = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 37, 36, 36),
      appBar: AppBar(
        centerTitle: true,
        title: Text("EDvice",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 78, 78, 78),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: Container(
    //     decoration: BoxDecoration(
    //   image: DecorationImage(image: AssetImage("assets/images/stars.png"), fit: BoxFit.cover),
    // ),
        
        child: Stack(
          children: <Widget>[
            Header(),
            Container(
              
              child: Padding(
                padding: EdgeInsets.all(Constants.mainPadding),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(height: Constants.mainPadding * 2),
                    Text(
                      "Welcome back\nUser!",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 94, 94, 94),
                      ),
                    ),
                    SizedBox(height: Constants.mainPadding),
                    SizedBox(height: 39.0),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xFFFEF3F3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "The World of Learning!\n",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.textDark,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: 150,
                                child: TextButton(
                                  onPressed: () {
                                    
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Constants.salmonMain,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "ENTER",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Image.asset(
                            "assets/images/researching.png",
                            width: 200,
                            height: 104,
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(height: Constants.mainPadding),
                    //SizedBox(height: 30.0),
                    Center(
                      child: Text(
                        "Discover Courses",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: double.infinity, 
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                        items: [
                          {
                            "title": "Flutter Development",
                            "description": "12 hours, 24 lessons",
                            "image": "assets/images/flutter.png"
                          },
                          {
                            "title": "Machine Learning",
                            "description": "8 hours, 16 lessons",
                            "image": "assets/images/ml.png"
                          },
                          {
                            "title": "Cyber Security",
                            "description": "15 hours, 30 lessons",
                            "image": "assets/images/cyber.png" 
                          },
                        ].map((course) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity, 
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Constants.lightPink,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      course["image"] ?? "assets/images/icon_2.png", 
                                      width: 60,
                                      height: 60,
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      course["title"] ?? "Unknown Title", 
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.textDark,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      course["description"] ?? "No description available", 
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Constants.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        "Your Courses",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        CardCourses(
                          image: Image.asset("assets/images/icon_1.png",
                              width: 40, height: 40),
                          color: Constants.lightPink,
                          title: "Data Structures",
                          hours: "14 hours, 27 lessons",
                          progress: "25%",
                          percentage: 0.25,
                          key: GlobalKey(),
                        ),
                        CardCourses(
                          image: Image.asset("assets/images/icon_2.png",
                              width: 40, height: 40),
                          color: Constants.lightPink,
                          title: "Java",
                          hours: "10 hours, 19 lessons",
                          progress: "50%",
                          percentage: 0.5, 
                          key: GlobalKey(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 0),
    );
  }
}
