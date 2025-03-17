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
import 'package:bookia/features/auth/presentation/pages/forgot_password.dart';
import 'package:bookia/features/auth/presentation/pages/register_view.dart';
import 'package:bookia/features/auth/presentation/widgets/login_ways.dart';
import 'package:bookia/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const PopContainer(),
      ),
      body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              showLoadingDialog(context);
            } else if (state is AuthError) {
              Navigator.of(context).pop();
              showErrorToast(context, state.message);
            } else if (state is AuthSuccess) {
              Navigator.of(context).pop();
              log("success");
              context.pushAndRemoveUntil(const MainView());
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Welcome back! Glad to see you, Again!',
                      style: getHeadLineTextStyle(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: obscureText
                              ? SvgPicture.asset('assets/icons/eye.svg')
                              : const Icon(
                                  Icons.visibility_off,
                                  color: AppColors.greyColor,
                                ),
                        ),
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.pushTo(const ForgotPassword());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: getSmallTextStyle(),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(AuthParams(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                color: AppColors.borderColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or Login with',
                            style:
                                getSmallTextStyle(color: AppColors.darkColor),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                color: AppColors.borderColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginWays(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: getBodyTextStyle(context),
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const RegisterView());
              },
              child: Text(
                'Register now',
                style: getBodyTextStyle(context, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
