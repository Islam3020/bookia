import 'dart:developer';

import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/bloc/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/pages/login_view.dart';
import 'package:bookia/features/auth/presentation/widgets/login_ways.dart';
import 'package:bookia/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PopContainer(),
        automaticallyImplyLeading: false,
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
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Hello! Register to get started',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(hintText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration:
                          const InputDecoration(hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Register',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(AuthParams(
                              name: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 1,
                          decoration:
                              const BoxDecoration(color: Color(0xffE8ECF4)),
                        ),
                        const Text(
                          'Or Register with',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          width: 100,
                          height: 1,
                          decoration:
                              const BoxDecoration(color: Color(0xffE8ECF4)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LoginWays(),
                    const SizedBox(
                      height: 10,
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
            const Text(
              'Already have an account? ',
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const LoginView());
              },
              child: const Text(
                'Login Now',
                style: TextStyle(color: Color(0xffBFA054)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
