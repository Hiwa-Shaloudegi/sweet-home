import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ConstructorType {
  simple,
  search,
  password,
  repeatPassword,
  datePicker,
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double padding;
  final Widget suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  // final int maxLength;
  final TextInputType keyboardType;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final ConstructorType constructorType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.maxLines = 1,
    // this.maxLength = 20,
    this.padding = 10,
    this.suffixIcon = const SizedBox.shrink(),
    this.prefixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.constructorType = ConstructorType.simple,
  });

  const CustomTextField.password({
    super.key,
    required this.controller,
    required this.validator,
    required this.onSaved,
    this.hintText = 'رمز عبور',
    this.maxLines = 1,
    // this.maxLength = 6,
    this.padding = 10,
    this.suffixIcon = const Icon(Icons.visibility_off),
    this.prefixIcon,
    this.obscureText = true,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.constructorType = ConstructorType.password,
  });

  const CustomTextField.repeatPassword({
    super.key,
    required this.controller,
    required this.validator,
    required this.onSaved,
    this.hintText = 'تکرار رمز عبور',
    this.maxLines = 1,
    // this.maxLength = 6,
    this.padding = 10,
    this.suffixIcon = const Icon(Icons.visibility_off),
    this.prefixIcon,
    this.obscureText = true,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.constructorType = ConstructorType.repeatPassword,
  });

  const CustomTextField.search({
    super.key,
    required this.controller,
    required this.validator,
    required this.onSaved,
    this.hintText = 'جستجو',
    this.padding = 10,
    this.maxLines = 1,
    this.suffixIcon = const SizedBox.shrink(),
    this.prefixIcon = const Icon(Icons.search),
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.constructorType = ConstructorType.search,
  });

  const CustomTextField.datePicker({
    super.key,
    required this.controller,
    required this.validator,
    required this.onSaved,
    this.hintText = 'تاریخ',
    this.padding = 10,
    this.maxLines = 1,
    this.suffixIcon = const SizedBox.shrink(),
    this.prefixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.constructorType = ConstructorType.datePicker,
  });

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]|\b'))]
          : inputFormatters,
      obscureText: obscureText,
      // maxLength: maxLength,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        // counterText: '',
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onTap: onTap,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: constructorType == ConstructorType.search
          ? textFormField
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hintText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                textFormField,
              ],
            ),
    );
  }
}
