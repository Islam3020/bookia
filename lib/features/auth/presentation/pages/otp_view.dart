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
import 'package:bookia/features/auth/presentation/pages/cereate_new_password_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController otpController = TextEditingController();

  bool isCompleted() {
    return otpController.text.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PopContainer(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
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
              context.pushReplacement(const CereateNewPasswordScreen());
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the verification code we just sent on your email address.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        length: 6,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        defaultPinTheme: PinTheme(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 70,
                          height: 60,
                          textStyle: getTitleTextStyle(context),
                          decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 70,
                          height: 60,
                          textStyle: getTitleTextStyle(context),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    if (isCompleted()) {
                      int value = int.parse(otpController.text);
                      context.read<AuthCubit>().checkForgetPassword(AuthParams(
                            verificationCode: value,
                          ));
                    }
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn’t receive code?'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Resend',
                          style: TextStyle(color: Color(0xffBFA054))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
