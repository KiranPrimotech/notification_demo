import 'package:authentication/feature/LoginMethod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneLogin extends LoginMethod{
  @override
  Future<User?> execute() async{
    print("Phone Login");
  }
}

class TweelioLogin extends LoginMethod{
  @override
  Future<User?> execute() async{
    print("Tweelio Login");
  }
}