      validator: (v) {
        if (v == null || v.isEmpty) {
          return "please enter password";
        } else if (!RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*]).{8,}$',
        ).hasMatch((v))) {
          return "Password must contain A-Z, a-z, 0-9, special character & minimum 8 characters";
        } else {
          return "";
        }
      },



 color: Color(0xffFF4444)