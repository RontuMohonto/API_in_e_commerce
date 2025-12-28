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



appBar: AppBar(
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [
Color(0xFFFF4F4F),
Color(0xFFFF9A37)],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),
),
),
centerTitle: true,
title: CustomText(
text: "Product's",
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),