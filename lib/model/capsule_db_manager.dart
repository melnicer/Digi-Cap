import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'time_capsule.dart';

class CapsuleDbManager extends ChangeNotifier {
  List<TimeCapsule> futureCapsules = [];
  List<TimeCapsule> pastCapsules = [];

  void addCapsule(TimeCapsule capsule) async {
    await Supabase.instance.client.from('capsules').insert({
      'title': capsule.title,
      'content': capsule.getContent(),
      'open_at': capsule.getOpenDate()?.toIso8601String(),
    });
  }

  void addFutureCapsule(TimeCapsule capsule) {
    futureCapsules.add(capsule);
    notifyListeners();
  }

  List<TimeCapsule> getFutureCapsules() {
    return futureCapsules;
  }

  List<TimeCapsule> getPastCapsules() {
    return pastCapsules;
  }

  int getFutureCapsulesLength() {
    return futureCapsules.length;
  }

  int getPastCapsulesLength() {
    return pastCapsules.length;
  }

  void sortAndMoveExpiredCapsules() {
    DateTime now = DateTime.now();

    pastCapsules.addAll(
      futureCapsules.where((capsule) {
        final date = capsule.openDate;
        return date == null || !date.isAfter(now);
      }).toList(),
    );

    futureCapsules.removeWhere((capsule) {
      final date = capsule.openDate;
      return date == null || !date.isAfter(now);
    });

    futureCapsules.sort((a, b) {
      final aDate = a.openDate;
      final bDate = b.openDate;

      if (aDate == null && bDate == null) return 0;
      if (aDate == null) return 1;
      if (bDate == null) return -1;

      return aDate.compareTo(bDate);
    });

    notifyListeners();
  }

  void deleteFutureCapsule(int index) {
    futureCapsules.removeAt(index);
    notifyListeners();
  }

  void deletePastCapsule(int index) {
    pastCapsules.removeAt(index);
    notifyListeners();
  }
}
