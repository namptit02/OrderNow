import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/view/forgotpassword/forgotpassword.dart';
// import 'package:flutter_application_chuyenman/view/signup/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String? usernameValue;
  String? passwordValue;
  String? usernameError;
  String? passwordError;
  String? passOrUserError;
  // ignore: prefer_typing_uninitialized_variables
  var _isObscured;
  SharedPreferences? prefs;

  @override
  void initState() {
    // Obtain shared preferences.
    initSharedPref();
    usernameController = TextEditingController(text: usernameValue);
    passwordController = TextEditingController(text: passwordValue);
    super.initState();
    _isObscured = true;
  }

  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
    // final loginData = prefs?.getString("loginData");
    // if (loginData == null) {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     Navigator.pushNamed(context, "/login");
    //   });
    // } else {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     Navigator.pushNamed(
    //       context,
    //       "/screen2",
    //       arguments: ScreenArgument(
    //         usernameValue: loginData,
    //       ),
    //     );
    //   });
    // }
    // print(loginData);
    //
  }
  // void requestPermission() async{
  //   Map<Permission, PermissionStatus> statuses = await
  // }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("dang nhap"),
      //   automaticallyImplyLeading: true,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
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
                  Color(0xFFBBA9ED), // replace with your desired starting color
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
                      height: 82,
                    ),
                    const Text(
                      "Welcome to OrderNow",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Image.asset(
                      'assets/images/donut.png',
                      width: 96,
                      height: 109,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 342,
                          height: 235,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(color: Colors.black)],
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Positioned(
                          top: 39,
                          left: 15,
                          child: Container(
                            width: 311,
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
                          top: 147,
                          left: 15,
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
                              obscureText: _isObscured,
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
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  icon: _isObscured
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
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
                          final password = passwordController.text.trim();
                          if (password.length < 6) {
                            Fluttertoast.showToast(
                              msg:
                                  "Password must be at least 6 characters long.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                            return;
                          }
                          try {
                            await Auth().loginWithEmailAndPassword(
                                email: usernameController.text.trim(),
                                password: passwordController.text.trim());
                            Fluttertoast.showToast(
                              msg: "Logged in successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                            );
                          } catch (error) {
                            Fluttertoast.showToast(
                              msg: "Incorrect password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                            );

                            // print(error.toString());
                          }
                        },
                        child: const Text(
                          "Sign In",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()),
                        );
                      },
                      child: const Text("Forgot password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                    ),
                    const SizedBox(
                      height: 10,
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
                        GestureDetector(
                            onTap: () => Auth().signInWithGoogle(),
                            child: Image.asset("assets/images/google.png"))
                      ],
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account yet?"),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: const Text(
                            "Sign up",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/signup_screen");
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
