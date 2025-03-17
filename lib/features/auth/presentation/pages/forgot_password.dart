import 'dart:developer';

import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/pages/login_view.dart';
import 'package:bookia/features/auth/presentation/pages/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PopContainer(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                showLoadingDialog(context);
              } else if (state is AuthError) {
                Navigator.of(context).pop();
                showErrorToast(context, state.message);
              } else if (state is AuthSuccess) {
                Navigator.of(context).pop();
                log("success");
                context.pushTo(const OTPVerification());
              }
            },
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
                    controller: emailController,
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
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().forgetPassword(AuthParams(
                              email: emailController.text,
                            ));
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
      ),
    );
  }
}
