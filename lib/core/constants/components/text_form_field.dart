import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';
import 'package:inspire_me/core/constants/apptextstyles.dart';

class TextFormFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String hinttext;
  final String validatorText;
  final String submittedvalue;
  final ValueChanged<String>? onvaluechange;
  final VoidCallback? onhidepasswordchange;
  final bool obsecuretextvalue;

  final bool isPasswordField;

  const TextFormFieldComponent({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.validatorText,
    this.submittedvalue = '',
    this.onvaluechange,
    this.onhidepasswordchange,
    this.isPasswordField = false,
    this.obsecuretextvalue = false,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      //keyboardType: widget.isPasswordField ? TextInputType.visiblePassword : TextInputType.emailAddress,
      keyboardType: TextInputType.text,
      obscureText: widget.obsecuretextvalue,
      style: Theme.of(context).brightness == Brightness.dark
          ? TextStyle(fontSize: 14.sp, color: Colors.white)
          : TextStyle(fontSize: 14.sp, color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hinttext,
        hintStyle: AppTextStyles.subheading(context),
        fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        filled: true,

        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: AppColors.lightTextPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: AppColors.lightTextPrimary),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                color: AppColors.accent,
                icon: Icon(widget.obsecuretextvalue ? Icons.visibility_off : Icons.visibility),
                onPressed: widget.onhidepasswordchange,
              )
            : null,
      ),
      onSaved: (newValue) {},
      validator: (value) {
        if (value == null || value.isEmpty) return widget.validatorText;
        return null;
      },
      onChanged: widget.onvaluechange,
    );
  }
}
