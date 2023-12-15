



const String _emailPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
final RegExp _emailRegExp = RegExp(_emailPattern);



class Validator {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) return 'Email is required';
    if (!_emailRegExp.hasMatch(email.trim())) return 'Email is not valid.';
    return null;
  }

  static String? requiredValidator(String? value) {
    if (value != null && value.trim().isNotEmpty) return null;
    return 'This field is required';
  }
}
