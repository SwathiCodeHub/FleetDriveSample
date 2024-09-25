extension DateTimeFormatting on int {
  String formatDate() {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return "${date.month}/${date.day}/${date.year} - ${date.hour % 12}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}";
  }
}

extension KitStatusExtension on String {
  bool isEquivalentKitStatus() {
    return [
      "ALLOCATED",
      "NETC_EXCEPTION",
      "NETC_NOTEXCEPTION"
    ].contains(this);
  }
}
