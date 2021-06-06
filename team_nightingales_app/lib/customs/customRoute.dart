import 'package:flutter/cupertino.dart';
// название
class MyRoute<T> extends CupertinoPageRoute<T> {
  MyRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // return FadeTransition(
    //   opacity: animation,
    //   child: child,
    // );
    // return SizeTransition(
    //   sizeFactor: animation,
    //   child: child,
    // );
    // return ScaleTransition(
    //   scale: animation,
    //   child: child,
    // );
    // return RotationTransition(
    //   turns: animation,
    //   child: child,
    // );
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: Offset(
            5.0,
            0.0,
          ),
          end: Offset.zero,
        ),
      ),
      child: child,
      transformHitTests: false,
    );
  }
}