import 'package:flutter/material.dart';

class myFormFeild extends StatelessWidget {
  const myFormFeild({
    super.key,
    required this.hint,
    required this.controller,
    this.readonly = false,
    this.validator,
    this.onTap,
  });
  final String hint;
  final TextEditingController controller;
  final bool readonly;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readonly,
      onTap: onTap,
      validator:
          validator ??
          (value) {
            //return string erorr
            if (value?.trim().isEmpty == true) {
              return ("please insert correct a vaule $hint");
            }
            //return null no erorr
            return null;
          },
      decoration: InputDecoration(
        hint: Text(hint),
        label: Text(hint),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
