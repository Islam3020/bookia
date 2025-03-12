import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/auth/presentation/pages/login_view.dart';
import 'package:bookia/features/auth/presentation/pages/otp_view.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PopContainer(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Forgot Password?',
                  style: getTitleTextStyle(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  style: getSmallTextStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.pushReplacement(OTPVerification());
                    }
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Remember Password?'),
                    TextButton(
                        onPressed: () {
                          context.pushReplacement(const LoginView());
                        },
                        child: const Text('Login',
                            style: TextStyle(color: AppColors.primaryColor)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
