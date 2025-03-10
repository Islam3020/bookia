import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/pop_container.dart';
import 'package:flutter/material.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    print("Entered OTP: $otp");
    // Implement OTP verification logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Row(
                  children: [
                    PopContainer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter the verification code we just sent on your email address.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 65,
                      child: TextFormField(
                        cursorColor: AppColors.primaryColor,
                        controller: _controllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor))),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Verify',
                  onPressed: _verifyOTP,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn’t received code?'),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Resend',
                            style: TextStyle(color: Color(0xffBFA054))))
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
