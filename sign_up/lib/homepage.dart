import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class LoginStrings {
  static const assetImageText = 'assets/images/fundo_pipoca.jpg';
  static const titleText = 'Filmes Flutter';
  static const subtitleText = 'Sign Up';
  static const errorEmailText = 'Can\'t be empty';
  static const emailHintText = 'name@example.com';
  static const emailLabelText = 'E-mail';
  static const errorTextPassword = 'Must have at least 8 characters';
  static const passwordLabelText = 'Password';
  static const buttonText = 'Sign in';
}

class _HomePageState extends State<HomePage> {
  bool isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorTextEmail;
  String? errorTextPassword;
  final nodePassword = FocusNode();

  String? get errorTextEmailOn {
    if (emailController.value.text.isEmpty) {
      return LoginStrings.errorEmailText;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                LoginStrings.assetImageText,
                fit: BoxFit.cover,
                opacity: kImageOpacity,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: kCenterPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child:
                          Text(LoginStrings.titleText, style: kTitleTextStyle),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Center(
                      child: Text(
                        LoginStrings.subtitleText,
                        style: TextStyle(
                            fontSize: 30.0, color: Colors.blue.shade100),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: LoginStrings.emailHintText,
                        labelText: LoginStrings.emailLabelText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade600, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: kTFBorderSide,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: errorTextEmail,
                      ),
                      onTap: () {
                        errorTextEmail = errorTextEmailOn;
                      },
                      onChanged: (value) {
                        setState(() {
                          errorTextEmail = errorTextEmailOn;
                        });
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(nodePassword);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: passwordController,
                      focusNode: nodePassword,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        labelText: LoginStrings.passwordLabelText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade600, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: kTFBorderSide,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: errorTextPassword,
                      ),
                      onChanged: (value) {
                        setState(() {
                          (passwordController.value.text.length < 8)
                              ? errorTextPassword =
                                  LoginStrings.errorTextPassword
                              : errorTextPassword = null;
                        });
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: kButtonSize,
                        elevation: 5.0,
                        disabledBackgroundColor: Colors.grey,
                        shadowColor: Colors.black,
                      ),
                      onPressed: (emailController.value.text.isEmpty ||
                              passwordController.value.text.length < 8)
                          ? null
                          : (() {
                              setState(() {});
                            }),
                      child: const Text(
                        LoginStrings.buttonText,
                        style: kButtonStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
