import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({
    super.key,
    emailController,
    pwController,
    required this.onTap,
    });

  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

    void login () {

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
          
              SizedBox(height: 25,),
          
              // app name
              const Text(
                'M I N I M A L',
                style: TextStyle(fontSize: 20),
              ),
          
              const SizedBox(height: 25,),
          
              // email textfield
              MyTextfield(
                hintText: 'Email', 
                obscureText: false, 
                controller: emailController,
                ),

                const SizedBox(height: 10,),
          
              // password textField
              MyTextfield(
                hintText: 'Password', 
                obscureText: true, 
                controller: pwController,
                ),

                const SizedBox(height: 10,),
          
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

              const SizedBox(height: 10,),
          
              // sign in button
              MyButton(
                text: 'Login', 
                onTap: login,
                ),

                const SizedBox(height: 10,),

              //don't have an account? Register here
              Row(
                children: [
                  const Text(
                    'Don\'t have an account?',
                  ),

                  SizedBox(width: 4,),

                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register Here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ), 
      ),
    );
  }
}