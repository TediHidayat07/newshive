import 'package:flutter/material.dart';
import 'package:newshive/views/utils/custom_form_field.dart';
import 'package:newshive/views/utils/form_validator.dart';
import 'package:newshive/views/widgets/primary_button.dart';
import 'utils/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello',
                    style: headline1.copyWith(
                      color: cBlack,
                      fontWeight: semibold,
                    ),
                    children: [
                      TextSpan(
                        text: '\nAgain!',
                        style: headline1.copyWith(color: cPrimary),
                      ),
                    ],
                  ),
                ),
                vsSmall,
                Text('Welcome back you’ve been missed', style: subtitle1),
                vsXLarge,
                RichText(
                  text: TextSpan(
                    text: '* ',
                    style: subtitle2.copyWith(color: cError),
                    children: [
                      TextSpan(
                        text: 'Email',
                        style: subtitle2.copyWith(color: cBlack),
                      ),
                    ],
                  ),
                ),
                vsSuperTiny,
                CustomFormField(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                ),
                vsSmall,
                RichText(
                  text: TextSpan(
                    text: '* ',
                    style: subtitle2.copyWith(color: cError),
                    children: [
                      TextSpan(
                        text: 'Password',
                        style: subtitle2.copyWith(color: cBlack),
                      ),
                    ],
                  ),
                ),
                vsSuperTiny,
                CustomFormField(
                  controller: passwordController,
                  hintText: 'Email',
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  validator: validatePassword,
                  obscureText: isObscure,
                ),
                vsMedium,
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: subtitle2.copyWith(color: cError),
                    ),
                  ),
                ),
                Spacer(),
                PrimaryButton(onPressed: () {}, title: 'Login'),
                vsSmall,
                Center(
                  child: Text(
                    'Don’t have an account? Sign Up',
                    textAlign: TextAlign.center,
                    style: subtitle2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
