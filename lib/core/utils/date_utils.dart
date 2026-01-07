String formatDate(DateTime date) {
  return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
}