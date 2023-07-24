import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Text("Go!"),
      )),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-0.9, 0.9); //offset(dx, dy);
        const end = Offset.zero; // offset(0,0);

        // using chaing to combine animation;
        var curve = Curves.easeInOutQuart;
        // var curveTween = CurveTween(curve: curve);
        // final animationcombine =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);
        // final tweenanimation = animation.drive(animationcombine);

        // TODO Using CurvedAnimation
        final curveAnimation = CurvedAnimation(
          curve: curve,
          parent: animation,
        );
        final toanimate = tween.animate(curveAnimation);
        // slide animation extends AnimatedWigdet
        return SlideTransition(
          position: toanimate,

          child: child,
        );
      },
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
