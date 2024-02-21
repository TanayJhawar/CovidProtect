import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sakecblue/Login/login.dart';

abstract class BaseAuth {
  Stream<String> get onAuthStateChanged;
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<String> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<String> currentUser();
  Future<void> signOut();
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  // ignore: non_constant_identifier_names
  Future<String> verifyPhoneNumber(PhoneNo);
  bool getIfCodeSent();
  bool setCodeSentFalse();
  // ignore: non_constant_identifier_names
  Future<String> signInWithOTP(smsCode,PhoneNo);
}

class Auth implements BaseAuth  {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =  GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();

  @override
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user
        .uid;
  }

  @override
  Future<String> currentUser() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user
        .uid;
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _auth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: _auth.accessToken,
      idToken: _auth.idToken,
    );
    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
  }

  @override
  Future<void> signOut() async{
    codeSent = false;
    setCodeSentFalse();
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();

  
    return _firebaseAuth.signOut();

  }

  @override
  // ignore: missing_return
  Future<String> signInWithFacebook() async {
    try{
    final result = await _facebookLogin.logIn(['email']);

    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
    );
     return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
    }
    catch(er){
      print(er);
    }
   
  }
  String verificationId,smsCode;
  bool codeSent = false;

  @override
  bool getIfCodeSent()
  {
    return codeSent;
  }
  @override
  // ignore: missing_return
  bool setCodeSentFalse(){
    codeSent = false;
  }
  @override
  // ignore: missing_return
  Future<String> verifyPhoneNumber
  // ignore: non_constant_identifier_names
  (PhoneNo) async{

    final PhoneVerificationCompleted verified = (AuthCredential authResult) async{
      return (await  _firebaseAuth.signInWithCredential(authResult)).user.uid;
    };
    final PhoneVerificationFailed verificationfailed = (AuthException authException){
      print('${authException.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      codeSent = true;
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
      // ignore: unnecessary_statements
      this.verificationId;
    };


      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: PhoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified ,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
  @override
  // ignore: non_constant_identifier_names
  Future<String> signInWithOTP(smsCode,PhoneNo) async {
    // ignore: unused_local_variable
    final PhoneVerificationCompleted verified = (AuthCredential authResult) async{
      return (await  _firebaseAuth.signInWithCredential(authResult)).user.uid;
    };
    // ignore: unused_local_variable
    final PhoneVerificationFailed verificationfailed = (AuthException authException){
      print('${authException.message}');
    };
    // ignore: unused_local_variable
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      codeSent = true;
    };
    // ignore: unused_local_variable
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
      // ignore: unnecessary_statements
      this.verificationId;
    };


    AuthCredential authcreds = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
    return (await  _firebaseAuth.signInWithCredential(authcreds)).user.uid;

  }
}


