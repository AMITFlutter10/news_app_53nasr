class User{

  String email;
  String password;

  User({
    required this.email,
    required this.password,
  });
 // post
  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }
 // get
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}