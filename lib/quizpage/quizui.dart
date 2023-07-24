import 'package:flutter/material.dart';
import 'package:flutter_docs/quizpage/quiz&question.dart';
import 'package:flutter_docs/quizpage/scoringsystem.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<QuizScorer>(
        create: (_) => QuizScorer(),
        child: const QuizScreen(),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController = PageController();
  final questions = quizList;

  Color optionBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // final scorer = Provider.of<QuizScorer>(context);
    void _showGameOverDialog(BuildContext context,  ) {
      showDialog(
          context: context,
          builder: (BuildContext context ) {
            return AlertDialog(
              title: const Text('Game Over'),
              content: Text(
                  'Your have run out of lives. Your Score:${Provider.of<QuizScorer>(context).score}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Provider.of<QuizScorer>(context, listen: false)
                        .resetScoreAndLives();
                    _pageController.jumpToPage(0);
                    Navigator.pop(context);
                  },
                  child: const Text("Restart Quiz"),
                ),
              ],
            );
          });
    }

    return Consumer<QuizScorer>(builder: (context, scorer, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz app'),
        ),
        body: Column(
          // padding: const EdgeInsets.all(10),
          children: [
            // Scorer(scorer: scorer),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Score: ${scorer.score}'),
                Text('Live: ${scorer.live}'),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  for (var question in questions) ...[
                    SizedBox(
                      height: 700,
                      width: 350,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 300,
                            height: 200,
                            decoration: const BoxDecoration(),
                            child: Text(question.question),
                          ),
                          ...List<Widget>.generate(
                            question.options.length,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  final isCorrect = Provider.of<QuizScorer>(
                                          context,
                                          listen: false)
                                      .checkAnswer(
                                    question.options[index],
                                    question.correctAnswer,
                                  );

                                  if (isCorrect) {
                                  } else {
                                    if (scorer.live == 0) {
                                      _showGameOverDialog(context);
                                    }
                                  }
                                  print(
                                      'lives ${scorer.live},score${scorer.score}');
                                  setState(() {
                                    optionBackgroundColor =
                                        isCorrect ? Colors.green : Colors.red;
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {
                                      optionBackgroundColor = Colors.white;
                                    });
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.bounceIn);
                                  });
                                },
                                child: Container(
                                  height: 70,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: optionBackgroundColor,
                                  ),
                                  child: Text(question.options[index]),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ]
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class Scorer extends StatelessWidget {
  const Scorer({
    super.key,
    required this.scorer,
  });

  final QuizScorer scorer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Score: ${scorer.score}'),
          Text('Live: ${scorer.live}'),
        ],
      ),
    );
  }
}
