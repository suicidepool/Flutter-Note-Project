import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_again_again/constants/routes.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Column(
        children: [
          const Text(
            "We have sent an email to your email address. Please open and click on the link sent.",
          ),
          const Text(
            "If you have not received an email, click on the button below.",
          ),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              devtools.log(user.toString());
              await user?.sendEmailVerification();
              devtools.log("Sent");
            },
            child: const Text("Send Email Verification"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);  
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}
