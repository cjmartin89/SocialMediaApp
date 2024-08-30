import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';
import 'package:social_media_app/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void registerUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    //make sure passwords match
    if (pwController.text != confirmPwController.text) {
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser('Passwords don\'t match!', context);
    }

    // if passwords do match
    else {
      // try creating the user
      try {
        // create the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: pwController.text);

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        // display error message to user
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(
              height: 25,
            ),

            // app name
            const Text(
              'M I N I M A L',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(
              height: 25,
            ),

            // username textfield
            MyTextfield(
              hintText: 'Username',
              obscureText: false,
              controller: usernameController,
            ),

            const SizedBox(
              height: 10,
            ),

            // email textfield
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            // password textField
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: pwController,
            ),

            const SizedBox(
              height: 10,
            ),

            // confirm password textField
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: confirmPwController,
            ),

            const SizedBox(
              height: 10,
            ),

            // forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            // sign in button
            MyButton(
              text: 'Register',
              onTap: registerUser,
            ),

            const SizedBox(
              height: 10,
            ),

            //don't have an account? Register here
            Row(
              children: [
                const Text(
                  'Already have an account?',
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login Here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
