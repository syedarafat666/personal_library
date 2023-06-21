const String baseUrl = 'http://192.168.100.4:8000/api';

class ApiEndPoint{
  static const String baseUrl = 'http://192.168.100.4:8000/api';
  static _AuthEndPoint authEndPoint = _AuthEndPoint();
}

class _AuthEndPoint{
  final String registerEmail = '/register';
  final String loginEmail = '/signin';
  final String getBooks = '/getBooks';
  final String addBooks = '/addbook';
  final String bookStats = '/booksStats';
  final String logout = '/logout';
  final String updateBook = '/updatebook';
  final String deleteBook = '/deleteBook';
}

