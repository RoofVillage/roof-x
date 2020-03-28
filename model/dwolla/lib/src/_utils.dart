// Get dateOfBirth in YYYY-MM-DD format
String formatDateOfBirth(DateTime dateOfBirth) =>
    dateOfBirth.toIso8601String().substring(0, 11);
