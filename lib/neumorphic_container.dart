import 'package:flutter/material.dart';
import 'color_utils.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Color color;
  final Offset blurOffset;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.bevel),
            color: Colors.grey.shade200,
            // border: Border(
            //   top: BorderSide(width: bevel, color: Color(0xFFFFFFFFFF)),
            //   left: BorderSide(width: bevel, color: Color(0xFFFFFFFFFF)),
            //   right: BorderSide(width: bevel, color: Color(0xFFFF000000)),
            //   bottom: BorderSide(width: bevel, color: Color(0xFFFF000000)),
            // ),
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: -widget.blurOffset,
                      color: color.mix(Colors.white, .5),
                    ),
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: widget.blurOffset,
                      color: color.mix(Colors.black, .3),
                    ),
                  ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .1),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                color.mix(Colors.white, _isPressed ? .2 : .3),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ],
            ),
          ),
          // child: Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          //   decoration: BoxDecoration(
          //     border: Border(
          //       top: BorderSide(width: bevel, color: Color(0xFFFFDFDFDF)),
          //       left: BorderSide(width: bevel, color: Color(0xFFFFDFDFDF)),
          //       right: BorderSide(width: bevel, color: Color(0xFFFF7F7F7F)),
          //       bottom: BorderSide(width: bevel, color: Color(0xFFFF7F7F7F)),
          //     ),
          //     color: Color(0xFFBFBFBF),
          //   ),
          //   child: child,
          // ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: widget.child,
        ),
      ),
    );
  }
}
