extension ExtendedStringList on List<String> {
  bool containsCaseInsensitive(String toCheck) {
    return this.map((e) => e.toLowerCase()).contains(toCheck.toLowerCase());
  }

  bool containsSubCaseInsensitive(String toCheck) {
    var lowered = this.map((e) => e.toLowerCase()).toList();

    for (int i = 0; i < lowered.length; i++) {
      if (lowered[i].contains(toCheck.toLowerCase())) {
        return true;
      }
    }

    return false;
  }
}
