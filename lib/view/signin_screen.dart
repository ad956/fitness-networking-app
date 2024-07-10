import 'package:fitness/utils/utils.dart';
import 'package:fitness/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);
  ValueNotifier<bool> emailError = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordError = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHidden.dispose(); // Dispose of the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final _currentAuthSelection = context.watch<WelcomeProvider>();

    String? emailMobile = '';
    String? password = '';

    Future<Widget> _loadImage() async {
      await precacheImage(AssetImage("assets/images/emote.png"), context);
      return Image.asset("assets/images/emote.png");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: _loadImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data ?? SizedBox();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        textStyle: const TextStyle(fontSize: 20),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: emailError,
                            builder: (context, value, child) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: value
                                            ? const Color.fromARGB(
                                                255, 255, 17, 0)
                                            : Colors.black26,
                                        width: 1.5),
                                  ),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email or Mobile',
                                    icon: Icon(LucideIcons.atSign, size: 20),
                                    labelStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    hintText: 'Enter your Email / Mobile',
                                    hintStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      emailError.value = true;
                                      Utils.flushMesssage(context,
                                          "Email or mobile number is required");
                                    } else if (!ValidationUtils.isValidEmail(
                                            value) &&
                                        !ValidationUtils.isValidMobile(value)) {
                                      Utils.flushMesssage(context,
                                          "Please enter a valid email or mobile number");
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (!ValidationUtils.isValidEmail(value) &&
                                        !ValidationUtils.isValidMobile(value)) {
                                      emailError.value = true;
                                    } else {
                                      emailError.value = false;
                                    }
                                  },
                                  onSaved: (value) {
                                    emailMobile = value;
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: passwordError,
                            builder: (context, value, child) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: value
                                            ? const Color.fromARGB(
                                                255, 255, 17, 0)
                                            : Colors.black26,
                                        width: 1.5),
                                  ),
                                ),
                                child: ValueListenableBuilder<bool>(
                                    valueListenable: isHidden,
                                    builder: (context, isVisible, child) {
                                      return TextFormField(
                                        obscureText: !isVisible,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          icon: Icon(LucideIcons.keyRound,
                                              size: 20),
                                          labelStyle: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          hintText: 'Enter your Password',
                                          hintStyle: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          border: InputBorder.none,
                                          suffixIcon: InkWell(
                                              onTap: () => isHidden.value =
                                                  !isHidden.value,
                                              child: Icon(isHidden.value
                                                  ? LucideIcons.eyeOff
                                                  : LucideIcons.eye)),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            passwordError.value = true;
                                            Utils.flushMesssage(context,
                                                "Password is required");
                                          } else if (value.length < 6) {
                                            Utils.flushMesssage(context,
                                                'Password must be at least 6 characters long');
                                          } else if (!ValidationUtils
                                              .containsUppercase(value)) {
                                            Utils.flushMesssage(context,
                                                'Password must contain at least one uppercase letter');
                                          } else if (!ValidationUtils
                                              .containsLowercase(value)) {
                                            Utils.flushMesssage(context,
                                                'Password must contain at least one lowercase letter');
                                          } else if (!ValidationUtils
                                              .containsSpecialCharacter(
                                                  value)) {
                                            Utils.flushMesssage(context,
                                                'Password must contain at least one special character');
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (value.length < 6) {
                                            passwordError.value = true;
                                          } else if (!ValidationUtils
                                              .containsUppercase(value)) {
                                            passwordError.value = true;
                                          } else if (!ValidationUtils
                                              .containsLowercase(value)) {
                                            passwordError.value = true;
                                          } else if (!ValidationUtils
                                              .containsSpecialCharacter(
                                                  value)) {
                                            passwordError.value = true;
                                          } else {
                                            passwordError.value = false;
                                          }
                                        },
                                        onSaved: (value) {
                                          password = value;
                                        },
                                      );
                                    }),
                              );
                            },
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Center(
                                  child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Color(0xff6b29ff),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ))),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff6b29ff), //6b29ff
                                  fixedSize: Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              onPressed: () => {
                                    if (formKey.currentState!.validate())
                                      {
                                        formKey.currentState!.save(),
                                        print(
                                            "email : $emailMobile , pass : $password"),
                                        // pageController.nextPage(
                                        //   duration: const Duration(
                                        //       milliseconds: 500),
                                        //   curve: Curves.ease,
                                        // )
                                        if (!emailError.value &&
                                            !passwordError.value)
                                          widget.pageController.jumpToPage(1)
                                        else
                                          print("errror")
                                      }
                                    else
                                      {
                                        Fluttertoast.showToast(
                                            msg: "Something went wrong !!!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0)
                                      }
                                  },
                              child: Center(
                                  child: Text(
                                "Sign In",
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "OR",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              )),
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: ShapeDecoration(
                              color: const Color(0xfff6fbff),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/google.svg",
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sign In with Google",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Color(0xff575254),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                _currentAuthSelection.value = true;
                                widget.pageController.jumpToPage(0);
                              },
                              child: Center(
                                  child: Text(
                                "Don't have an account?",
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ))),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
