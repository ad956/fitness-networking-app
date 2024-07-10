import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final otpController = TextEditingController();
    String? otp = "";
    print(otp);

    return Scaffold(
      backgroundColor: const Color(0xffeef2f6),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 340,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/brand-logo.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Fitness Networking",
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hola 👋",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Color(0xffa7de00),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Verify your identity to continue",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Color(0xff575254),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter Your OTP",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Pinput(
                                  controller: otpController,
                                  onCompleted: (String pin) {
                                    print('Completed OTP: $pin');
                                    otp = pin;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Center(
                                        child: Text(
                                      "Resend OTP?",
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Color(0xff5e35b1),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ))),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    const Color(0xff5e35b1))),
                                    onPressed: () {},
                                    child: Center(
                                        child: Text(
                                      "SUBMIT",
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                    ))),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
