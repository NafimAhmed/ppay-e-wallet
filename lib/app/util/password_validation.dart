



class PasswordValidation{


  bool isPasswordValid(String password) {
    // Check for at least one uppercase letter
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));

    // Check for at least one lowercase letter
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));

    // Check for at least one number character
    bool hasNumber = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'));

    // Return true if all conditions are met (uppercase, lowercase, and number)
    return hasUppercase && hasLowercase && hasNumber && hasSpecialCharacter;
  }

}