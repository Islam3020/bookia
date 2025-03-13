import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/auth/presentation/pages/password_changed.dart';
import 'package:flutter/material.dart';

class CereateNewPasswordScreen extends StatefulWidget {
  const CereateNewPasswordScreen({super.key});

  @override
  State<CereateNewPasswordScreen> createState() => _CereateNewPasswordScreenState();
}

class _CereateNewPasswordScreenState extends State<CereateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const PopContainer(),automaticallyImplyLeading: false, ),
      body:SafeArea(
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
                  'Create new password',
                  style: getTitleTextStyle(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your new password must be unique from those previously used.',
                  style: getSmallTextStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'New Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Confirm Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: 'Reset Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     // context.pushReplacement(const OTPVerification());
                     context.pushReplacement(const PasswordChanged());
                    }
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}