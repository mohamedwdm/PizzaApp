import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class HasActiveCartCheckbox extends StatefulWidget {
  const HasActiveCartCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  @override
  State<HasActiveCartCheckbox> createState() => _HasActiveCartCheckboxState();
}

class _HasActiveCartCheckboxState extends State<HasActiveCartCheckbox> {
  late bool _hasActiveCart;

  @override
  void initState() {
    super.initState();
    _hasActiveCart = widget.initialValue;
  }

   @override
  void didUpdateWidget(covariant HasActiveCartCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 🔑 This ensures the checkbox resets when parent changes initialValue
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        _hasActiveCart = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          
          value: _hasActiveCart,
          activeColor: const Color(0xff22a45d),
          onChanged: (val) {
            setState(() {
              _hasActiveCart = val ?? false;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_hasActiveCart);
            }
          },
        ),
        const Text(
          "Has Active Cart",
          style: TextStyle(fontSize: 14 , color: kMediumGreyColor),
        ),
      ],
    );
  }
}
