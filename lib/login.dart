import 'package:fingerprintauth/authpage.dart';
import 'package:fingerprintauth/pagetwo.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 24, 66),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                "Use your fingerprint to login into the App!",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 28,
              ),
              Divider(
                color: Colors.white60,
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  bool auth = await Authentication.authenticate();
                  print("can authenticate: $auth");
                  if (auth) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.fingerprint),
                label: Text("Authentication"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
