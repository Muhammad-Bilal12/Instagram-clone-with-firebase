import 'package:flutter/material.dart';
import 'package:flutter_instagram/Screens/auth_screens/signup_screen.dart';
import 'package:flutter_instagram/resources/auth_methods.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/text_input_feild.dart';
import '../../utils/responsiveLayout/mobile_screen.dart';
import '../../utils/responsiveLayout/responsive_layout_screen.dart';
import '../../utils/responsiveLayout/web_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    String login = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (login == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreen: MobileScreen(),
                webScreen: WebScreen(),
              )));
    } else {
      showSnackBar(context, login);
    }
    setState(() {
      isLoading = false;
    });
  }

  navigatetoscreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Screen Logo

              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              // Email Text inpyt feild

              TextInputFeild(
                textEditingController: _emailController,
                hintText: "Enter Your Email",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              // Password Text inpyt feild

              TextInputFeild(
                isPass: true,
                textEditingController: _passwordController,
                hintText: "Enter Your Password",
                textInputType: TextInputType.text,
              ),
              // login Button
              const SizedBox(height: 24),
              InkWell(
                onTap: login,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("Login"),
                ),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  GestureDetector(
                    onTap: navigatetoscreen,
                    child: const Text(
                      "SignUp",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
