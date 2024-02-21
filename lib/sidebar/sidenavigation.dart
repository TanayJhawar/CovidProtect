import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakecblue/AdminApp/adminfirst.dart';
import 'package:sakecblue/Login/Login2/screens/login/login.dart';
import 'package:sakecblue/Login/auth.dart';
import 'package:sakecblue/Login/provider.dart';
import 'package:sakecblue/Profile/About.dart';
import 'package:sakecblue/TermsAndCondition/agreement.dart';
import 'package:sakecblue/TermsAndCondition/terms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page_transition.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavDrawer();
  }
}

class _NavDrawer extends State<NavDrawer> {
  String abc;
  var uuuid;

  Future<String> getdata() async {
    var firebaseUser1 = await FirebaseAuth.instance.currentUser();
    uuuid = firebaseUser1.email;
    if (uuuid != null) {
      uuuid = firebaseUser1.email;
    } else {
      uuuid = firebaseUser1.phoneNumber;
    }
    return uuuid;
  }

  @override
  void initState() {
    getdata().then((results) {
      setState(() {
        if (results.isEmpty) {
          debugPrint("Inside if ${abc}");
          abc = "Hello";
        } else {
          debugPrint("Inside Else ${abc}");
          abc = results;
        }
        // abc = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
//      child: abc == null
//          ? Container(
//        child: Center(
//          child: Text("Loading..."),
//        ),
//      )
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 115,
            color: Color(0xFF3b7dfb),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 35, left: 10),
              title: Text(
                abc != null ? abc : "User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
//              subtitle: Text(
//                abc,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 18,
//                ),
//              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                radius: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text(
              'Admin Login',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600),
                    child: AdminFirst()),
              ),
            },
          ),
          // Expanded(
          //   child:

          Container(
            margin: const EdgeInsets.only(left: 0, right: 0.0),
            child: Divider(
              color: Color(0xFF8a8e9a),
              height: 10,
            ),
          ),
          // ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text(
              'Call Helpline',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => {launch("tel: 1075")},
          ),
          // Expanded(
          //   child:
          Container(
              margin: const EdgeInsets.only(left: 0, right: 0.0),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'AboutUs',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Profile()),
              ),
            },
          ),
          // Expanded(
          //   child:

          // ),

          // ListTile(
          //   leading: Icon(Icons.account_box),
          //   title: Text(
          //     'Change Language',
          //     style: TextStyle(
          //       fontSize: 16,
          //     ),
          //   ),
          //   onTap: () =>
          //   {
          //     debugPrint('Changing Lang'),
          //     EasyLocalization
          //         .of(context)
          //         .locale = Locale('hi', 'IN')
          //   },
          // ),
          // Expanded(
          //   child:
          Container(
              margin: const EdgeInsets.only(left: 0, right: 0.0),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () async {
              try {
                Auth auth = Provider.of(context).auth;
                await auth.signOut();
              } catch (e) {
                print(e);
              }

              Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Login1()),
              );
            },
          ),
//          Divider(
//            height: 30,
//            thickness: 1,
//            color: Color(0xFF8a8e9a),
//            indent: 1,
//            endIndent: 1,
//          ),
//           Expanded(
//             child:
          Container(
              margin: const EdgeInsets.only(left: 0, right: 0.0),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                color: Color(0xFF3b7dfb),
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Agra()),
              )
            },
          ),
//          Expanded(
//            child: new Container(
//                margin: const EdgeInsets.only(left: 0, right: 0.0),
//                child: Divider(
//                  color: Color(0xFF8a8e9a),
//                                    height: 10,

//                )),
//          ),
          ListTile(
            title: Text(
              'Terms & Conditions',
              style: TextStyle(
                color: Color(0xFF3b7dfb),
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Terms()),
              )
            },
          ),
        ],
      ),
    );
  }
}
