import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/view/widget_tree/widget_tree.dart';

import '../../common/authentication.dart';
// import 'package:flutter_application_chuyenman/view/login/login.dart';
// import '../widget_tree/widget_tree.dart';

// ignore: use_key_in_widget_constructors
class SignUpPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  String? usernameValue;
  String? passwordValue;
  String? confirmPasswordValue;
  // ignore: annotate_overrides
  void initState() {
    // Obtain shared preferences.
    // initSharedPref();
    usernameController = TextEditingController(text: usernameValue);
    passwordController = TextEditingController(text: passwordValue);
    confirmPasswordController =
        TextEditingController(text: confirmPasswordValue);
    super.initState();
    // _isObscured = true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
          backgroundColor: Colors.deepPurple,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  // begin: Alignment.topCenter,
                  // end: Alignment.bottomCenter,
                  colors: [
                    Color(
                        0xFFBBA9ED), // replace with your desired starting color
                    Color(0xFFFEFEFE), // replace with your desired ending color
                  ],
                  stops: [
                    0.0909, // replace with your desired stop value for the first color
                    1.2359, // replace with your desired stop value for the second color
                  ],
                  // you can also adjust the angle and center of the gradient if needed
                  // angle: 293.67 * (pi / 180),
                  // center: Alignment.center,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      // const Text(
                      //   "Create Account",
                      //   style: TextStyle(
                      //       fontSize: 34, fontWeight: FontWeight.w600),
                      // ),

                      const SizedBox(
                        height: 28,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 333,
                            height: 314,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(color: Colors.black)],
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Positioned(
                            top: 27,
                            left: 10,
                            child: Container(
                              width: 314,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.04),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                onChanged: (String value) {
                                  usernameValue = value;
                                },
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your username',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.9),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 253),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 115, 24, 138),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 10,
                            child: Container(
                              width: 311,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.04),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                onChanged: (String value) {
                                  passwordValue = value;
                                },
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.9),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 253),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 115, 24, 138),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 210,
                            left: 10,
                            child: Container(
                              width: 311,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.04),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                onChanged: (String value) {
                                  passwordValue = value;
                                },
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password 1 more',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.9),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 253),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 115, 24, 138),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      SizedBox(
                        width: 312,
                        height: 42,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: const Color(0xff8359E3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          onPressed: () async {
                            if (passwordController.text.trim() ==
                                confirmPasswordController.text.trim()) {
                              try {
                                await Auth().signupWithEmailAndPassword(
                                    email: usernameController.text.trim(),
                                    password: passwordController.text.trim());
                                await Auth().logOut();
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WidgetTree()),
                                );
                              } catch (error) {
                                // ignore: avoid_print
                                print(error.toString());
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content:
                                        const Text("Passwords do not match."),
                                    actions: [
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            // if (usernameController.text.length < 6 &&
                            //     passwordController.text.length < 6 &&
                            //     usernameController.text.isNotEmpty &&
                            //     passwordController.text.isNotEmpty) {
                            //   setState(() {
                            //     usernameError =
                            //         "Username không được nhỏ hơn 6 ký tự";
                            //     passwordError =
                            //         "Password không được nhỏ hơn 6 kí tự";
                            //   });
                            // }
                            // if (usernameController.text.length >= 6 &&
                            //     passwordController.text.length >= 6) {
                            //   setState(() {
                            //     usernameError = null;
                            //     passwordError = null;
                            //     usernameValue = usernameController.text;
                            //     passwordValue = passwordController.text;
                            //   });
                            // }
                            // if (usernameController.text.isEmpty ||
                            //     passwordController.text.isEmpty) {
                            //   setState(() {
                            //     usernameError = "Username không được để rỗng";
                            //     passwordError = "Password không được để rỗng";
                            //   });
                            // }
                            // if (usernameController.text.contains(" ") ||
                            //     passwordController.text.contains(" ")) {
                            //   setState(() {
                            //     usernameError = "Username không được để dấu cách";
                            //     passwordError = "Password không được để dấu cách";
                            //   });
                            // }

                            // if (usernameController.text.toLowerCase() ==
                            //         "namhoang2k2" &&
                            //     passwordController.text == "123456") {
                            //   await prefs?.setString(
                            //     "loginData",
                            //     usernameController.text,
                            //   );
                            //   print("luu du lieu thanh cong");
                            //   // ignore: use_build_context_synchronously
                            //   Navigator.pushNamed(context, "/screen2",
                            //       arguments: ScreenArgument(
                            //           usernameValue: usernameController.text));
                            // }
                          },
                          child: const Text(
                            "Sign Up",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const Text("Or"),
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/facebook.png"),
                          const SizedBox(
                            width: 59,
                          ),
                          Image.asset("assets/images/google.png")
                        ],
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text("Don’t have an account yet?"),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     InkWell(
                      //       child: Text(
                      //         "Sign up",
                      //         style:
                      //             TextStyle(decoration: TextDecoration.underline),
                      //       ),
                      //       onTap: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => Login(
                      //                     title: 'Dang nhap',
                      //                   )),
                      //         );
                      //       },
                      //     )
                      //   ],
                      // )
                      // Row(

                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
