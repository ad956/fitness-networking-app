import 'package:fitness/core/routes/routes_config.dart';
import 'package:fitness/core/routes/routes_constants.dart';
import 'package:fitness/viewmodel/roles_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRole = context.watch<RolesProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => AppRouter.goto(context, RouteNames.welcomeRoute),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 25,
                ),
              ),
            ),
            LoadingAnimationWidget.staggeredDotsWave(
              color: const Color(0xff6b29ff),
              size: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => currentRole.value = true,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentRole.value
                                        ? Color(0xff6b29ff)
                                        : Colors.black,
                                    width: 2),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/images/pan.png",
                              ),
                            ),
                          ),
                          Text(
                            "Gym User",
                            style: GoogleFonts.cairoPlay(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => currentRole.value = false,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentRole.value
                                        ? Colors.black
                                        : Color(0xff6b29ff),
                                    width: 2),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/images/gym.png",
                              ),
                            ),
                          ),
                          Text(
                            "Gym Manager",
                            style: GoogleFonts.cairoPlay(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "To give you a customize experience we need to know your profile",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6b29ff), //6b29ff
                      fixedSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () =>
                      AppRouter.goto(context, RouteNames.authRoute),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ))),
            ),
          ],
        ),
      )),
    );
  }
}
