import 'package:flutter/material.dart';
import 'color_utils.dart';

class NeumorphicTextField extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;

  NeumorphicTextField({
    Key key,
    this.width,
    this.height,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  _NeumorphicTextFieldState createState() => _NeumorphicTextFieldState();
}

class _NeumorphicTextFieldState extends State<NeumorphicTextField> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
      print('up');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        child: Container(
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: widget.color.mix(Colors.black, .2),
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                ),
                BoxShadow(
                  color: widget.color.mix(Colors.grey[200], .2),
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                ),
              ],
              // gradient: _isPressed
              //     ? LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [
              //           widget.color.mix(Colors.black, .2),
              //           widget.color.mix(Colors.black, .1),
              //           widget.color.mix(Colors.grey[200], .1),
              //           widget.color.mix(Colors.grey[200], .1),
              //         ],
              //         stops: [
              //           0.1,
              //           0.3,
              //           0.8,
              //           0.9,
              //         ],
              //       )
              //     : null,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
