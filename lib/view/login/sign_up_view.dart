import 'package:cp_book_store/view/main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String name = "";
  String email = "";
  String mobile = "";
  String password = "";

  bool isLoading = false;
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _formkeysignup = GlobalKey<FormState>();

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  Future<void> register() async {
    if (txtFirstName.text.isEmpty ||
        txtPassword.text.isEmpty ||
        txtEmail.text.isEmpty ||
        txtMobile.text.isEmpty) {
      showSnackBar(
        context,
        "Please fill in all fields...!",
      );
    }

    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              password: txtPassword.text.trim(), email: txtEmail.text.trim());
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
              "Registered Successfully",
              style: TextStyle(
                fontSize: 20,
              ),
            ))));
      }
      // String userId = userCredential.user!.uid;

      // await FirebaseFirestore.instance.collection('users').doc(userId).set(
      //   {
      //     'id': userId,
      //     'name': nameController.text,
      //     'username': usernameController.text,
      //     'following': [],
      //     'followers': [],
      //   },
      // );
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          if (context.mounted) {
            showSnackBar(context, "Password provided is too weak");
          }
          break;
        case 'email-already-in-use':
          if (context.mounted) {
            showSnackBar(context, "Account already exists!");
          }
          break;
        case 'invalid-email':
          if (context.mounted) {
            showSnackBar(context, " email address is not valid.");
          }
          break;
        case 'operation-not-allowed':
          if (context.mounted) {
            showSnackBar(context,
                "Enable email/password accounts in the Firebase Console, under the Auth tab.");
          }

        default:
          // Handle other FirebaseException codes here
          break;
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
          icon: const Icon(Icons.arrow_back_ios),
          color: TColor.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkeysignup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Name.";
                    }
                    return null;
                  },
                  controller: txtFirstName,
                  hintText: "First & Last Name",
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email.";
                    }
                    return null;
                  },
                  controller: txtEmail,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  controller: txtMobile,
                  hintText: "Mobile Phone",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Mobile number.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextfield(
                  controller: txtCode,
                  hintText: "Group Special Code (optional)",
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
                  obscureText: isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                        "Please sign me up for the monthly newsletter.",
                        style: TextStyle(
                          color: TColor.subTitle.withOpacity(0.3),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                RoundLineButton(
                    isLoading: isLoading,
                    title: "Sign Up",
                    onPressed: () async {
                      if (_formkeysignup.currentState!.validate()) {
                        setState(() {
                          email = txtEmail.text.trim();
                          password = txtPassword.text.trim();
                          name = txtFirstName.text.trim();
                          mobile = txtMobile.text.trim();
                        });
                      }
                      register();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 1.91,
          left: 20,
          right: 20),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.redAccent,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
