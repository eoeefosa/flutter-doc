class Quiz {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Quiz({required this.options, required this.question, required this.correctAnswer});
}


List<Quiz> quizList = [
  Quiz(
    question: "What is the capital of France?",
    options: ["Paris", "Berlin", "Rome", "London"],
    correctAnswer: "Paris"
  ),
  Quiz(
    question: "Which animal has the longest lifespan?",
    options: ["Elephant", "Tortoise", "Whale", "Parrot"],
    correctAnswer: "Tortoise"
  ),
  Quiz(
    question: "Who wrote the Harry Potter series?",
    options: ["J.R.R. Tolkien", "George R.R. Martin", "J.K. Rowling", "C.S. Lewis"],
    correctAnswer: "J.K. Rowling"
  ),
  Quiz(
    question: "What is the name of the largest bone in the human body?",
    options: ["Femur", "Humerus", "Tibia", "Fibula"],
    correctAnswer: "Femur"
  ),
  Quiz(
    question: "Which planet is the second smallest in the solar system?",
    options: ["Mercury", "Mars", "Venus", "Pluto"],
    correctAnswer: "Mars"
  ),
  Quiz(
    question: "What is the name of the phobia that means fear of spiders?",
    options: ["Arachnophobia", "Acrophobia", "Agoraphobia", "Claustrophobia"],
    correctAnswer: "Arachnophobia"
  ),
  Quiz(
    question: "Which country is the only one to border both the Atlantic and Indian oceans?",
    options: ["Brazil", "South Africa", "Australia", "Indonesia"],
    correctAnswer: "South Africa"
  ),
  Quiz(
    question: "What is the name of the currency used in Japan?",
    options: ["Yen", "Won", "Rupee", "Dollar"],
    correctAnswer: "Yen"
  ),
  Quiz(
    question: "Which musical instrument has six strings?",
    options: ["Violin", "Piano", "Guitar", "Harp"],
    correctAnswer: "Guitar"
  ),
  Quiz(
    question: "What is the term for a word that is spelled the same forwards and backwards?",
    options: ["Anagram", "Palindrome", "Homonym", "Acronym"],
    correctAnswer: "Palindrome"
  )
];
