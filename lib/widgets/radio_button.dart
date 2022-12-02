import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  int value;
  int grupValue;
  Color? color;
  Color? selectColor;
  void Function(int?)? onChanged;

  CustomRadio({
    super.key,
    required this.value,
    required this.grupValue,
    this.color = Colors.grey,
    this.selectColor = Colors.green,
    this.onChanged,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = widget.value != widget.grupValue;
        if(selected){
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: widget.value == widget.grupValue
              ? widget.selectColor
              : widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
