
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';

  String email;
  String pass;
  String str;
  String confirm;
class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            ClipRRect(
              borderRadius: new BorderRadius.circular(80.0),
              child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/index1.jpg'),
              width: 130.0,
              height: 130.0,
            ),
          ),

            Divider(),
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email", 
              onSubmitted: (String str) {
                  setState((){
                       email = str;
                  });
              },
            ),
            RoundedPasswordField(
              onSubmitted: (String str) {
                setState((){
                      pass = str;
                  });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: (){
                if (str.isEmpty){
                         AlertDialog alertDialog = new AlertDialog(
                            content: new Text(
                              "E-mail Sama Password tidak Boleh Kosong",
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 20.0),
                            ),
                            actions: [
                              new RaisedButton(
                                color: Colors.purple,
                                child: new Text("OK"),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                            )]
                          ); 
                         showDialog(context: context, child: alertDialog);
                      }
                 else Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen(),
                  ),
            );  
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            );
          },
        ),
      ])
    ));
    }
}

