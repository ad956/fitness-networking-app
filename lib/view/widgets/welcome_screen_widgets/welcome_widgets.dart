import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget welcome(PageController pageController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/around.png"),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Welcome to Fitness Networking",
            style: GoogleFonts.poppins(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 25),
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          "assets/images/emote.png",
          height: 100,
        ),
      ],
    ),
  );
}

Widget gym(PageController pageController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/gym.png"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Hit the Gym 🏋️‍♂️",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20),
          child: Text(
            "Find nearby gyms, access facilities hassle-free, and enjoy a seamless gym experience.",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}

Widget connect(PageController pageController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/map.png"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "🤝 Connect with People ♂️",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20),
          child: Text(
            "Discover & connect with fitness enthusiasts, build a community, and achieve your goals together.",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}

Widget track(BuildContext context, PageController pageController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/track.png"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "📊 Track Your Progress",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20),
          child: Text(
            "Track your fitness journey, monitor workouts, and witness your transformation.",
            style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
