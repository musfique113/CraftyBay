class FormValidator {
  //email validator
  static String? validateEmail (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    // Check if the email address is at least 6 characters long.
    if (value.length < 6) {
      return 'Email address must be at least 6 characters long.';
    }
    // Check if the email address does not contain any spaces.
    if (value.contains(' ')) {
      return 'Email address cannot contain any spaces.';
    }
    // Check if the email address contains an @ symbol.
    if (!value.contains('@')) {
      return 'Email address must contain an @ symbol.';
    }
    // Check if the email address contains a domain name.
    int atIndex = value.indexOf('@');
    String domain = value.substring(atIndex + 1);
    if (!domain.contains('.')) {
      return 'Email address must contain a domain name.';
    }
    // Check if the domain name is a valid top-level domain (TLD).
    List<String> tlds = ['com', 'org', 'net', 'edu', 'gov'];
    if (!tlds.contains(domain.substring(domain.lastIndexOf('.') + 1))) {
      return 'Email address must have a valid top-level domain (TLD).';
    }
    return null;
  }


// Helper function to validate the domain.
  bool isValidDomain(String domain) {
    // Implement the domain validation logic here.
    // You can use DNS checks or other methods to verify the domain.
    // For simplicity, we'll assume any domain is valid in this example.
    return true;
  }

// Helper function to check for disposable email addresses.
  bool isDisposableEmail(String email) {
    // Implement the disposable email check logic here.
    // You can use a list of known disposable email domains or APIs to check.
    // For simplicity, we'll assume no disposable email is used in this example.
    return false;
  }

// Helper function to check for common email providers.
  bool isCommonEmailProvider(String email) {
    // Implement the common email provider check logic here.
    // You can use a list of known common email provider domains or patterns.
    // For simplicity, we'll assume no common email providers are used in this example.
    return false;
  }


  //name validator
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  //mobile number validator
  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    // Check if the mobile number is 10 digits long.
    if (value.length != 11) {
      return 'Mobile number must be 11 digits long';
    }

    // Check if the mobile number starts with a 0,1.
    if (value[0] != '0' && value[0] != '1') {
      return 'Mobile number must start with 0 and 1';
    }

    // Check if the mobile number is a valid number.
    try {
      int.parse(value);
    } catch (e) {
      return 'Mobile number must be a valid number';
    }
    return null;
  }

  //password validator signup
  static String? validPasswordSignUp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Minimum length validation
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Maximum length validation
    if (value.length > 20) {
      return 'Password can be up to 20 characters long';
    }

    // Uppercase and lowercase letters validation
    if (!value.contains(RegExp(r'[a-z]')) || !value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain both uppercase and lowercase letters';
    }

    // Numbers validation
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one numerical digit';
    }

    // Special characters validation
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // No spaces validation
    if (value.contains(' ')) {
      return 'Password cannot contain spaces';
    }

    // Password is valid
    return null;
  }

  //valid passLogin
  static String? validPasswordLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // You can add more specific password validation here if needed.
    return null;
  }



}
