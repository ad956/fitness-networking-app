import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/view/widgets/home_widgets/spline_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Color.fromARGB(255, 238, 238, 240),
    //     systemNavigationBarColor: Color.fromARGB(255, 238, 238, 240),
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark));
    ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 10,
          leading: Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  LucideIcons.text,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            );
          }),
          actions: [
            Icon(
              LucideIcons.bell,
              size: 2,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Morning",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Anand Suthar",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        // CachedNetworkImageProvider("https://i.pinimg.com/564x/d8/4f/c2/d84fc23a0fb7712c7418dd427a0d5266.jpg")
                        AssetImage("assets/images/male.png"),
                    radius: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (context, value, child) {
                  return SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        navItems(0, _pageController, _currentIndex,
                            LucideIcons.slack, "Dashboard"),
                        navItems(1, _pageController, _currentIndex,
                            LucideIcons.personStanding, "Progress"),
                        navItems(2, _pageController, _currentIndex,
                            LucideIcons.compass, "Explore"),
                        navItems(3, _pageController, _currentIndex,
                            LucideIcons.slack, "Credit Ponits"),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                children: [_dashboard(), _progress(), _explore(), _points()],
              ))
            ],
          ),
        ));
  }
}

Widget navItems(int index, PageController _pageController,
    ValueNotifier<int> _currentIndex, IconData icon, String iconName) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () {
        switch (index) {
          case 0:
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            _currentIndex.value = 0;
            break;
          case 1:
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            _currentIndex.value = 1;
            break;
          case 2:
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            _currentIndex.value = 2;
            break;
          case 3:
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            _currentIndex.value = 3;
            break;
        }
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: index == _currentIndex.value ? Colors.black : Colors.grey,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            iconName,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: index == _currentIndex.value
                        ? Colors.black
                        : Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 2,
          ),
          (index == _currentIndex.value)
              ? Container(
                  decoration: ShapeDecoration(
                      color: Color(0xff3a27fe), shape: CircleBorder()),
                  height: 10,
                  width: 10,
                )
              : Container()
        ],
      ),
    ),
  );
}

Widget _dashboard() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Points",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ),
              Text(
                "1245",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              Icon(LucideIcons.scan),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Scanner",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 18,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Current Gym",
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: commentCardColors[0],
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            "Fitness Track Gym",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      // total points, side me QR ,current gym , graphs
      const SizedBox(
        height: 28,
      ),
      Text(
        "Points Usage",
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      FutureBuilder(
        future: _loadGraphs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return SplineArea();
        },
      )
    ],
  );
}

Future<SplineArea> _loadGraphs() async {
  await Future.delayed(Duration(seconds: 3));
  return SplineArea();
}

Widget _progress() {
  return Container(
    color: Color.fromARGB(255, 255, 255, 255),
    height: 100,
    width: 200,
  );
}

Widget _explore() {
  return Container(
    color: Color.fromARGB(255, 0, 0, 0),
    height: 100,
    width: 200,
  );
}

Widget _points() {
  return Container(
    color: Color.fromARGB(255, 147, 145, 171),
    height: 100,
    width: 200,
  );
}

const commentCardColors = [
  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF81C2F1),
      Color(0xFF7BBBF3),
      Color(0xFF77B3F4),
      Color(0xFF78AAF4),
      Color(0xFF7CA1F3),
    ],
  ),
  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF4B166),
      Color(0xFFF3AD64),
      Color(0xFFF2A961),
      Color(0xFFF0A45F),
      Color(0xFFEFA05D),
    ],
  ),
  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFED6793),
      Color(0xFFED638B),
      Color(0xFFEC5F83),
      Color(0xFFEB5B7A),
      Color(0xFFE95772),
    ],
  ),
  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFC979F2),
      Color(0xFFBC7BF3),
      Color(0xFFAF7CF4),
      Color(0xFFA17EF4),
      Color(0xFF937FF4),
    ],
  ),
  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF6AE7CE),
      Color(0xFF69E5C8),
      Color(0xFF68E4C3),
      Color(0xFF68E2BD),
      Color(0xFF68E0B7),
    ],
  ),
];
