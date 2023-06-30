import 'package:flutter/material.dart';

import '../../common/authentication.dart';
// import 'package:flutter_application_chuyenman/view/login/login.dart';

// ignore: use_key_in_widget_constructors
class ForgotPasswordPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController usernameController;
  // late final TextEditingController passwordController;

  String? usernameValue;
  // String? passwordValue;
  // String? confirmPasswordValue;
  @override
  void initState() {
    // Obtain shared preferences.
    // initSharedPref();
    usernameController = TextEditingController(text: usernameValue);

    super.initState();
    // _isObscured = true;
  }

  @override
  void dispose() {
    usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot password'),
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
                        height: 150,
                      ),
                      const Text(
                        "Forgot password",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 333,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(color: Colors.black)],
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Positioned(
                            top: 50,
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
                            try {
                              await Auth().forGotPassword(
                                email: usernameController.text.trim(),
                              );
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text("Vui long check email"),
                                    );
                                  });
                            } catch (error) {
                              // ignore: avoid_print
                              print(error.toString());
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(error.toString()),
                                    );
                                  });
                            }
                          },
                          child: const Text(
                            "Reset password",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
