import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final double? largura;
  final Widget? prefixIcon;
  const TextFieldCustom(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.largura,
      this.prefixIcon})
      : super(key: key);

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.largura ?? MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        controller: widget.controller,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Color.fromRGBO(32, 32, 86, 1.0),
                style: BorderStyle.solid,
                width: 3),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 35, 78, 152),
                  style: BorderStyle.solid,
                  width: 3)),
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon ?? Icon(Icons.person),
        ),
      ),
    );
  }
}
