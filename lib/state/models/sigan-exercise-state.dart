class SiganExerciseState {
  String correctHour;
  String userHour = '';
  String correctMin;
  String userMin = '';
  String correctSec;
  String userSec = '';
  int hour;
  int min;
  int sec;

  SiganExerciseState({
    required this.hour,
    required this.min,
    required this.sec,
    required this.correctHour,
    required this.correctMin,
    required this.correctSec,
  });
}
