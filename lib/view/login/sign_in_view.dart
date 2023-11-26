import 'package:cp_book_store/view/main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import 'forgot_password_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String code = "";
  String password = "";
  String email = "";
  bool isLoading = false;
  bool isPasswordVisible = false;

  final _formkey = GlobalKey<FormState>();

  TextEditingController txtCode = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  Future<void> login() async {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        // margin: EdgeInsets.only(
        //     bottom: media.width * 1.4,
        //     left: 20,
        //     right: 20),
        backgroundColor: Colors.redAccent,
        content: Text(
          "Please enter both email and password",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ));
      return; // Stop execution if fields are empty
    }

    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text.trim(),
        password: txtPassword.text.trim(),
      );
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainTabView()));
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
            content: Text(
              "Logged In Successfully",
              style: TextStyle(
                fontSize: 20,
              ),
            ))));
      }
    } on FirebaseException catch (e) {
      String errorMessage =
          "Invalid Credentials! Check your email & password again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong password provided by the user.";
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
            content: Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )));
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  controller: txtCode,
                  hintText: "Optional Group Special Code",
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  controller: txtEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email.";
                    }
                    return null;
                  },
                  hintText: "Email Address",
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: isPasswordVisible ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                  controller: txtPassword,
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password.";
                    }
                    return null;
                  },
                  obscureText: !isPasswordVisible,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isStay = !isStay;
                        });
                      },
                      icon: Icon(
                        isStay
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isStay
                            ? TColor.primary
                            : TColor.subTitle.withOpacity(0.3),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Stay Logged In",
                        style: TextStyle(
                          color: TColor.subTitle.withOpacity(0.3),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordView()));
                      },
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: TColor.subTitle.withOpacity(0.3),
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                RoundLineButton(
                    isLoading: isLoading,
                    title: "Sign In",
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = txtEmail.text.trim();
                          password = txtPassword.text.trim();
                        });
                      }
                      login();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
