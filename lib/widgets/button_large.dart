import 'package:flutter/material.dart';

class ButtonLargeWidget extends StatefulWidget {
  final String? image;
  final String? text;
  void Function()? onTap;
  ButtonLargeWidget(this.image, this.text, this.onTap, {Key? key})
      : super(key: key);

  @override
  _ButtonLargeWidgetState createState() => _ButtonLargeWidgetState();
}

class _ButtonLargeWidgetState extends State<ButtonLargeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap!,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 80,
                child: Image.network(widget.image!),
              ),
            ),
            Positioned(bottom: 0, child: _buildTitle())
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Container(
        child: Align(alignment: Alignment.center, child: Text(widget.text!)),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))));
  }
}
