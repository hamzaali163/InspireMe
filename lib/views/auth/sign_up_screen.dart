import 'package:flutter/material.dart';

import 'package:inspire_me/core/constants/apptextstyles.dart';
import 'package:inspire_me/core/constants/components/round_button.dart';
import 'package:inspire_me/core/constants/components/text_form_field.dart';
import 'package:inspire_me/providers/auth_vm.dart';
import 'package:inspire_me/routes/route_names.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    //    final isDark = theme.brightness == Brightness.dark;

    return Consumer<AuthVm>(
      builder: (context, vm, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign Up', style: AppTextStyles.heading(context)),
                    const SizedBox(height: 10),
                    Text('Create a new account', style: AppTextStyles.subheading(context)),
                    const SizedBox(height: 30),

                    TextFormFieldComponent(
                      controller: vm.namecontroller,
                      hinttext: 'Full Name',
                      validatorText: 'Enter full name',
                    ),
                    const SizedBox(height: 20),

                    TextFormFieldComponent(
                      controller: vm.signUpemailcontroller,
                      hinttext: 'Email',
                      validatorText: 'Enter email',
                    ),
                    const SizedBox(height: 20),

                    TextFormFieldComponent(
                      controller: vm.signUppasswordcontroller,
                      hinttext: 'Password',
                      validatorText: 'Enter password',
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),

                    RoundButton(
                      loading: vm.sigupload,
                      text: 'Sign Up',
                      onPressed: () {
                        vm.signUpuser(context);
                      },
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.loginscreen);
                          },
                          child: Text('Login', style: AppTextStyles.subheading(context)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
