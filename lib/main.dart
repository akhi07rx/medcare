import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:medcare/pages/Report%20Page/report_page.dart';
import 'components/bottom_nav_bar.dart';
import 'pages/Appointment_Page/appointment_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  final pages = [
    TopCardSection(),
    AppointmentPage(),
    ReportPage(),
    MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to Appointment Page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentPage()),
          );
        },
      ),
    );
  }
}

class AppColors {
  static Color grayBg = const Color(0xffEAECF0);
  static Color blue = const Color(0xff0165FC);
  static Color blueStrong = const Color(0xff1D4ED8);
  static Color secondaryGray = const Color(0xff545F76);
}

class AppDimensions {
  static double baseSize = 8;

  static SizedBox vSpace(int multiplier) =>
      SizedBox(height: baseSize * multiplier);

  static SizedBox hSpace(int multiplier) =>
      SizedBox(width: baseSize * multiplier);
}

class AppTexts {
  static TextStyle headline = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 23.sp,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 13.sp,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 11.sp,
  );
  static TextStyle subtitle2 = GoogleFonts.poppins(
    fontSize: 9.sp,
  );
}

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.baseSize * 2),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal),
          AppDimensions.hSpace(1),
          const Flexible(
              child: TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search here',
              border: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }
}

class UpcomingScheduleCard extends StatelessWidget {
  const UpcomingScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimensions.baseSize * 2),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 17,
                    backgroundImage: AssetImage("assets/Jennifer.png"),
                  ),
                  AppDimensions.hSpace(1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr Jennifer Fernando",
                        style: AppTexts.title.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Psychologist",
                        style: AppTexts.subtitle.copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              const CircleAvatar(
                radius: 17,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                child: Icon(
                  Iconsax.call,
                  size: 15,
                ),
              )
            ],
          ),
          AppDimensions.vSpace(2),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppDimensions.baseSize * 2),
            decoration: BoxDecoration(
              color: AppColors.blueStrong,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar,
                      color: Colors.white,
                      size: 15.w,
                    ),
                    AppDimensions.hSpace(1),
                    Text(
                      "23 October 2023",
                      style: AppTexts.subtitle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.clock,
                      color: Colors.white,
                      size: 15.w,
                    ),
                    AppDimensions.hSpace(1),
                    Text(
                      "12.35 - 13.45",
                      style: AppTexts.subtitle.copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopCardSection extends StatelessWidget {
  const TopCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.baseSize * 2.5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.grayBg,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDimensions.vSpace(3),
          appbar(),
          AppDimensions.vSpace(3),
          Text(
            "How are you feeling\ntoday?",
            style: AppTexts.headlineLarge
                .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          AppDimensions.vSpace(3),
          const SearchBox(),
          AppDimensions.vSpace(3),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Upcoming Schedule',
                        style: AppTexts.title
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      AppDimensions.hSpace(1),
                      const CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.redAccent,
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'View all',
                    style: AppTexts.subtitle
                        .copyWith(color: AppColors.secondaryGray),
                  ),
                ],
              ),
              AppDimensions.vSpace(2),
              const UpcomingScheduleCard(),
            ],
          ),
          AppDimensions.vSpace(1),
          StaggeredGrid.count(
            crossAxisCount: 6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/4383/4383617.png",
                          ),
                        ),
                        Text("Prescription")
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2830/2830510.png",
                          ),
                        ),
                        Text("Reports")
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2764/2764442.png",
                          ),
                        ),
                        Text("Appointments")
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/4090/4090491.png",
                          ),
                        ),
                        Text("Receipt")
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://static.thenounproject.com/png/2134394-200.png",
                          ),
                        ),
                        Text("IP Deposit")
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          icon: Image.network(
                            "https://dl3.pushbulletusercontent.com/5qThAPmiPQ7LGu2havj5nk6dFfzH3m5g/call-phone.png",
                          ),
                        ),
                        Text("Contact Us")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/boy.jpg"),
            ),
            AppDimensions.hSpace(1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: AppTexts.subtitle2
                      .copyWith(color: AppColors.secondaryGray),
                ),
                Text(
                  "Gwen Stacy",
                  style: AppTexts.title.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        const CircleAvatar(
          radius: 20,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: Icon(
            Iconsax.notification,
            size: 20,
          ),
        )
      ],
    );
  }
}
