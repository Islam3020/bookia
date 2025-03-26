import 'package:bookia/core/extension/extensions.dart';
import 'package:bookia/core/widgets/custom_buttons.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/checkout/data/models/checkout_reguest/checkout_request.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:bookia/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  _CheckoutViewState createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int? selectedGovId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: Scaffold(
        appBar: AppBar(title:const Text("Checkout")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutSuccessState) {
                showErrorToast(context, "Order placed successfully!");
                
                context.pushAndRemoveUntil(const MainView(),);
              } else if (state is CheckoutErrorState) {
                showErrorToast(context, state.message);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(hintText: "Name"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter your name" : null,
                        ),
                        const Gap(10),
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(hintText: "Phone"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter your phone" : null,
                        ),
                        const Gap(10),
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(hintText: "Address"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter your address" : null,
                        ),
                        const Gap(10),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(hintText: "Email"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter your email" : null,
                        ),
                        const Gap(10),
                        DropdownButtonFormField<int>(
                          value: selectedGovId,
                          decoration: const InputDecoration(hintText: "Governorate"),
                          items: const [
                            DropdownMenuItem(value: 1, child: Text("Cairo")),
                            DropdownMenuItem(value: 2, child: Text("Giza")),
                            DropdownMenuItem(value: 3, child: Text("Alexandria")),
                          ],
                          onChanged: (value) => setState(() => selectedGovId = value),
                          validator: (value) => value == null
                              ? "Select a governorate"
                              : null,
                        ),
                        const SizedBox(height: 20),
                        state is CheckoutLoadingState
                            ? const CircularProgressIndicator()
                            : CustomButton(text: "Place Order", onPressed:  () {
                                  if (_formKey.currentState!.validate()) {
                                    final params = CheckoutParams(
                                      nameController.text,
                                      selectedGovId!,
                                      phoneController.text,
                                      addressController.text,
                                      emailController.text,
                                    );
                                    context.read<CheckoutCubit>().placeOrder(params);
                                  }
                                },),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
