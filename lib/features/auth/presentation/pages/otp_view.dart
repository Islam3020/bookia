import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:bookia/features/auth/presentation/pages/cereate_new_password_screen.dart';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  void _verifyOTP() {
   // String otp = _otpController.text;
    
    
  }

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
                
                
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pinput(
                      length: 4,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: PinTheme(margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 70,
                        height: 60,
                        textStyle: getTitleTextStyle(context),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      focusedPinTheme: PinTheme(margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 70,
                        height: 60,
                        textStyle: getTitleTextStyle(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onCompleted: (otp) => _verifyOTP(),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                CustomButton(
                  text: 'Verify',
                  onPressed: (){
                    _verifyOTP();
                    context.pushTo(const CereateNewPasswordScreen());
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn’t receive code?'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Resend', style: TextStyle(color: Color(0xffBFA054))),
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
