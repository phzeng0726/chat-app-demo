import 'package:logger/logger.dart';

class LoggerService {
  static Logger simple = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 100,
    ),
  );
  static Logger full = Logger(
    printer: PrettyPrinter(
      lineLength: 100,
    ),
  );
}
