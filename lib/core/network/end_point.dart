abstract class EndPoint 
{
  // BASE URL
  static const String baseUrl = 'http://127.0.0.1:8000/api/';
  // AUTH
  static const String register = 'register';
  static const String login = 'auth/login';

  // CLASSES
  static const String classes = 'classes/get-classes';

  // SUBJECTS
  static const String subjects = 'subjects/get-subjects';
  static const String importantSubjects = 'subjects/get-important-subjects';

  // UNITS
  static const String units = 'units/get-units';
  
  // Quizzes
  static const String lastQuizzes = 'quizzes/last-quizzes';
  static const String unitQuizzes = 'quizzes/unit-quizzes';
  static const String completedQuizzes = 'quizzes/completed-quizzes';
  static const String addQuiz = 'student-quizzes/create';

  // QUESTIONS
  static const String questions = 'questions/quiz-questions';

  // STUDENT
  static const String updateProfile = 'students/update-profile';
  static const String getProfile = 'students/get-profile';
  
  // QUOTES
  static const String quotes = 'quotes/get-random';

  // OTHER
  static const String domainName = 'al-basheer-quizzes.mouhannadabdalrhem.online';
  static const String storageUrl = 'https://al-basheer-quizzes.mouhannadabdalrhem.online/storage/';
}
