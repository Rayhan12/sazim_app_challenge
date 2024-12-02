class Validator{
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    } else if (!RegExp('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "password are too short";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Please enter name";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "only alphabets allowed";
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return "Please enter price";
    }
    if(num.parse(value) <= 0)
      {
        return "Please enter a valid price";
      }
    return null;
  }

  String? noValidationRequired(String? value) {
    return null;
  }
}