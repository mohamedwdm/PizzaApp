import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, this.hintText, this.isPassword = false, this.onChanged, this.controller, this.validator});

  final String? hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator ?? (value) {
        if (value == null || value.isEmpty) return 'Field is required';
        return null;
      },
      onChanged: widget.onChanged ?? (_) {},
      obscureText: widget.isPassword ? _obscureText : false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: const Color(0xfff7f7f7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
