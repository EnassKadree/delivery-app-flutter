part of 'functions.dart';

extension Formatter on  Functions
{
  String formatSeconds(int seconds) 
  {
    int minutes = seconds ~/ 60; 
    int remainingSeconds = seconds % 60; 

    String formattedTime = [
      minutes.toString().padLeft(2, '0'),
      remainingSeconds.toString().padLeft(2, '0'),
    ].join(':');

    return formattedTime;
  }

  String formatLatex(String content) 
  {
    Map<String, String> replacements = {
      r'\!': '', 
      r'\exponentialE': 'e', 
      r'\left': '',
      r'\right': '', 
      r'\left\vert': '|', 
      r'\right\vert': '|',
    };

    replacements.forEach((key, value) {
      content = content.replaceAll(key, value);
    });

    return content;
  }
}
