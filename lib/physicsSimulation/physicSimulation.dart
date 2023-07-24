import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsCardDargDemo extends StatelessWidget {
  const PhysicsCardDargDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(
        child: FlutterLogo(size: 128),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key, required this.child});

  final Widget child;
  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _newcontroller;
  late Animation<Alignment> _animation;
  late Animation<Alignment> _newanimation;
  Alignment _dragAlignment = Alignment.center;
// ther _runAnimation method sets the direction by setting the

  void _newrunAnimaiton() {
    _newanimation = _newcontroller.drive(
      AlignmentTween(
        begin: const Alignment(0.1, 0.5),
        end: const Alignment(-2,-4), // set new target position here
      ),
    );
      const spring = SpringDescription(mass: 30, stiffness:1, damping:1,);

  }

// animation start and end alignment
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

// calculated the velocity relative to the unit interval, [0,1],
// Used by the animation controller
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitvelocity = unitsPerSecond.distance;
    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );
    final simulation = SpringSimulation(spring, 0, 1, -unitvelocity);

    _controller.animateWith(simulation);
    // _controller.reset();
    // _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    // TODO MY CONTROLLER
    _newcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    // TODO GESTURE DETECTOR CONTROLLER
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _newcontroller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.black,
            height: 30,
            width: 30,
          ),
        ),
        GestureDetector(
          onPanDown: (details) {
            print('details =$details');
            _controller.stop();
          },
          onPanUpdate: (details) {
            print('details =$details');

            print('details.delta =${details.delta}');

            setState(() {
              _dragAlignment += Alignment(
                details.delta.dx / (size.width / 2),
                details.delta.dy / (size.height / 2),
              );
            });
          },
          // onpadend provides a DragEndDetails object
          onPanEnd: (details) {
            _runAnimation(details.velocity.pixelsPerSecond, size);
          },
          child: Align(
            alignment: _dragAlignment,
            child: Card(
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
