import 'package:flutter/material.dart';
import 'package:flutter_docs/quizpage/scoringsystem.dart';
import 'package:provider/provider.dart';

import 'animatePageroute/page1.dart';
import 'physicsSimulation/physicSimulation.dart';
import 'quizpage/quizui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                title: const Text('Physic simulation'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const PhysicsCardDargDemo(),
                      ));
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                title: const Text('Quiz screen'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ChangeNotifierProvider<QuizScorer>(
                          create: (_) => QuizScorer(),
                          child: const QuizScreen(),
                        ),
                      ));
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                title: const Text('Navigation route animation'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Page1()));
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
