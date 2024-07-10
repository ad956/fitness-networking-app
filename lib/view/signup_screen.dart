import 'package:fitness/services/api_config.dart';
import 'package:fitness/services/api_service.dart';
import 'package:fitness/services/http_service.dart';
import 'package:fitness/utils/utils.dart';
import 'package:fitness/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  final PageController pageController;
  const SignUp({Key? key, required this.pageController}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name = '';
  String? email = '';
  String? mobile = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    final _currentAuthSelection = context.watch<WelcomeProvider>();
    ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);
    ValueNotifier<bool> nameError = ValueNotifier<bool>(false);
    ValueNotifier<bool> mobileError = ValueNotifier<bool>(false);
    ValueNotifier<bool> emailError = ValueNotifier<bool>(false);
    ValueNotifier<bool> passwordError = ValueNotifier<bool>(false);
    ValueNotifier<bool> repasswordError = ValueNotifier<bool>(false);

    final httpService = HttpService(ApiConfig.baseUrl);
    final apiService = ApiService(httpService);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Hi, Welcome",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xffa7de00),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter your credentials to continue",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ValueListenableBuilder<bool>(
                                  valueListenable: nameError,
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
                                          labelText: 'Name',
                                          icon: Icon(LucideIcons.atSign,
                                              size: 20),
                                          labelStyle: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          hintText: 'Enter your Name',
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
                                            Utils.flushMesssage(
                                                context, "Name is required");
                                          } else if (!ValidationUtils
                                              .isValidName(value)) {
                                            Utils.flushMesssage(context,
                                                "Please enter a valid name");
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (!ValidationUtils.isValidName(
                                              value)) {
                                            nameError.value = true;
                                          } else {
                                            nameError.value = false;
                                          }
                                        },
                                        onSaved: (value) {
                                          name = value;
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
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
                                          labelText: 'Email',
                                          icon: Icon(LucideIcons.atSign,
                                              size: 20),
                                          labelStyle: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          hintText: 'Enter your Email',
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
                                            Utils.flushMesssage(
                                                context, "Email  is required");
                                          } else if (!ValidationUtils
                                              .isValidEmail(value)) {
                                            Utils.flushMesssage(context,
                                                "Please enter a valid email");
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (!ValidationUtils.isValidEmail(
                                              value)) {
                                            emailError.value = true;
                                          } else {
                                            emailError.value = false;
                                          }
                                        },
                                        onSaved: (value) {
                                          email = value;
                                        },
                                      ),
                                    );
                                  },
                                ),
                                ValueListenableBuilder<bool>(
                                  valueListenable: mobileError,
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
                                          labelText: 'Mobile',
                                          icon: Icon(LucideIcons.atSign,
                                              size: 20),
                                          labelStyle: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          hintText: 'Enter your Mobile',
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
                                                "Mobile number is required");
                                          } else if (!ValidationUtils
                                              .isValidMobile(value)) {
                                            Utils.flushMesssage(context,
                                                "Please enter a valid mobile number");
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (!ValidationUtils.isValidMobile(
                                              value)) {
                                            mobileError.value = true;
                                          } else {
                                            mobileError.value = false;
                                          }
                                        },
                                        onSaved: (value) {
                                          mobile = value;
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
                                                labelStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                hintText: 'Enter your Password',
                                                hintStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                border: InputBorder.none,
                                                suffixIcon: InkWell(
                                                    onTap: () =>
                                                        isHidden.value =
                                                            !isHidden.value,
                                                    child: Icon(isHidden.value
                                                        ? LucideIcons.eyeOff
                                                        : LucideIcons.eye)),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
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
                                            );
                                          }),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ValueListenableBuilder<bool>(
                                  valueListenable: repasswordError,
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
                                                labelText: 'Reconfirm Password',
                                                icon: Icon(LucideIcons.keyRound,
                                                    size: 20),
                                                labelStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                hintText:
                                                    'Reconfirm your Password',
                                                hintStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                border: InputBorder.none,
                                                suffixIcon: InkWell(
                                                    onTap: () =>
                                                        isHidden.value =
                                                            !isHidden.value,
                                                    child: Icon(isHidden.value
                                                        ? LucideIcons.eyeOff
                                                        : LucideIcons.eye)),
                                              ),
                                              onChanged: (value) {
                                                if (password != value) {
                                                  repasswordError.value = true;
                                                } else {
                                                  repasswordError.value = false;
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color(0xff6b29ff), //6b29ff
                                          fixedSize: Size(300, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                      onPressed: () async => {
                                            if (formKey.currentState!
                                                .validate())
                                              {
                                                formKey.currentState!.save(),
                                                print(
                                                    "email : $email , pass : $password , name : $name ,"
                                                    " uname : $name, mobile : $mobile"
                                                    "  "),
                                                // widget.pageController.nextPage(
                                                //   duration: const Duration(
                                                //       milliseconds: 500),
                                                //   curve: Curves.ease,
                                                // )
                                                // apiService.userLogin("user",
                                                //     "ad12@mail.com", "abc123")

                                                // final response = await http.get(Uri.parse('')),
                                              }
                                          },
                                      child: Center(
                                          child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 1,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.black54),
                                      ),
                                      Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black54),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "OR",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            )),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xfff6fbff),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/google.svg",
                                            height: 25,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Sign up with Google",
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                  color: Color(0xff575254),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      _currentAuthSelection.value = false;
                                      widget.pageController.jumpToPage(0);
                                    },
                                    child: Center(
                                        child: Text(
                                      "have an account?",
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ))),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
