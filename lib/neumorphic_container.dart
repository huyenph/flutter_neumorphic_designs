import 'package:flutter/material.dart';
import 'color_utils.dart';

class NeumorphicContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;

  NeumorphicContainer({
    Key key,
    this.width,
    this.height,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
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
              color: _isPressed ? Colors.black.withOpacity(0.075) : widget.color,
              borderRadius: BorderRadius.circular(100),
              boxShadow: _isPressed
                  ? [
                    BoxShadow(
                        color: Colors.blue.shade300,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0,
                        spreadRadius: -2,
                      ),
                  ]
                  : [
                      BoxShadow(
                        color: widget.color.mix(Colors.black, .2),
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 0.5,
                      ),
                      BoxShadow(
                        color: widget.color.mix(Colors.grey[200], .2),
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
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
