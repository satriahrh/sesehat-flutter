String humanizeUnixTime(int unixTime) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  return humanizeDateTime(dateTime);
}

String humanizeDateTime(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);
  if (difference.inDays > 7) {
    return dateTime.toLocal().toString();
  } else if (difference.inDays > 0) {
    return '${difference.inDays}h';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}j';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}m';
  } else {
    return '${difference.inSeconds}d';
  }
}
