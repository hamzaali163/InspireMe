import 'package:flutter/material.dart';
import 'package:inspire_me/core/constants/apptextstyles.dart';
import 'package:inspire_me/core/constants/components/round_button.dart';
import 'package:inspire_me/core/constants/components/text_form_field.dart';
import 'package:inspire_me/providers/auth_vm.dart';
import 'package:inspire_me/routes/route_names.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //   final theme = Theme.of(context);
    //final isDark = theme.brightness == Brightness.dark;

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
                    Text('Login', style: AppTextStyles.heading(context)),

                    const SizedBox(height: 10),
                    Text('Please login in to continue', style: AppTextStyles.subheading(context)),
                    const SizedBox(height: 30),
                    TextFormFieldComponent(
                      controller: vm.emailcontroller,
                      hinttext: 'Email',
                      validatorText: "Enter email",
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldComponent(
                      controller: vm.passwordcontroller,
                      hinttext: 'Password',
                      validatorText: 'Enter password',
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    RoundButton(
                      loading: vm.loginload,
                      text: 'Login',
                      onPressed: () {
                        vm.loginuser(context);
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.signUpscreen);
                          },
                          child: Text('Sign Up', style: AppTextStyles.subheading(context)),
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
