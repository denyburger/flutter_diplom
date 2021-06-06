import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthClass{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future authMethod(
    String email,
    String password
  )
  async {
    try{
      UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      User userresult = user.user;
      return UserModel.fromFirebase(userresult);
    }catch(e){
      return Fluttertoast.showToast(msg: 'Такого пользователя не существует');
    }
  }
  Stream<UserModel> get streamUser{
    return auth.authStateChanges().map((User user) => user !=null ? UserModel.fromFirebase(user) : null);
  }
  Future logout() async{
      return await auth.signOut();
    }
  }

class UserModel{
  String id;
  UserModel.fromFirebase(User user){
    id = user.uid;
  }
}
