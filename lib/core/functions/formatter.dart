part of 'functions.dart';

extension Formatter on  Functions
{
  String handleParams(String url, String param)
  {
    return Uri.parse(url).replace(queryParameters: {'q': param}).toString();
  }
}
