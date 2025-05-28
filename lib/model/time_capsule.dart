import 'package:intl/intl.dart';

class TimeCapsule {
  String title = "";
  String content = "";
  DateTime creationDate;
  DateTime? openDate;

  TimeCapsule({
    required this.title,
    required this.content,
    required this.creationDate,
    required this.openDate,
  });

  String getTitle() {
    return title;
  }

  String getContent() {
    return content;
  }

  String getCreationDate() {
    String stringCreationDate = DateFormat('yyyy-MM-dd').format(creationDate);
    return stringCreationDate;
  }

  String getOpenDate() {
    String stringOpenDate = DateFormat('yyyy-MM-dd').format(openDate!);
    return stringOpenDate;
  }
}
