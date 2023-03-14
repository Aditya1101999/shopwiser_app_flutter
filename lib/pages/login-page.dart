import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await (Future.delayed(Duration(seconds: 1)));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 0.0,
              ),
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
                height: 300,
                width: 1500,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Hey $name !",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          }),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            } else if (value.length < 6) {
                              return "Password must contains 6 letters";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 50.0,
                      ),
                      InkWell(
                        onTap: (() => moveToHome(context)),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: context.theme.buttonColor,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8)),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          "Sign up with Google",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          "Sign up with Facebook",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
