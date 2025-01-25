import 'dart:developer';

class PrinterService {
  PrinterService._();

  static void print(String info, {String tag = 'PrinterService', StackTrace? stackTrace}) {
    log(info, name: tag, stackTrace: stackTrace);
  }
}
