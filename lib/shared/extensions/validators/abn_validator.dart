String? abnValidation(String? value) {
  final text = (value ?? '').trim();
  if (text.isEmpty) {
    return "ABN number is required";
  }
  // Strict regex: Must start with 880, followed by 1, then 3-9, then 8 digits.
  final RegExp abnReg = RegExp(r'^0-9');
  if (abnReg.hasMatch(text)) {
    return null;
  }
  return "ABN number is required";
}