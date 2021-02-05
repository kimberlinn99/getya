import 'package:flutter/material.dart';
import 'package:getya/widgets/custom_btn.dart';
import '../constants.dart';
import '../widgets/signin_form.dart';
import 'signup_screen.dart';

class SignInScreen extends StatelessWidget {
  static final routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 2,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/getya_logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: kDefaultPadding),
              SignInForm(),
              SizedBox(height: kDefaultPadding),
              _DividerWithText(),
              SizedBox(height: kDefaultPadding),
              CustomBtn(
                boxColor: kLightGreyColor,
                text: "Sign up",
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _DividerWithText() {
    return Row(children: <Widget>[
      Expanded(
        child: Divider(
          thickness: 2,
          color: Colors.grey[400],
        ),
      ),
      SizedBox(width: 5),
      Text(
        "Or",
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(width: 5),
      Expanded(
        child: Divider(
          thickness: 2,
          color: Colors.grey[400],
        ),
      ),
    ]);
  }
}
