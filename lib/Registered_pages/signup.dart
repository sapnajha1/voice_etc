
import 'package:englishetc_voice_ai/constWidget/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {

  var  googleSignInAccount;

  GoogleLogIn() async{
    GoogleSignIn _googlesignin= await GoogleSignIn(clientId: "245412232063-2q1afslmao7f47d0o6m35jm0efcvf3a9.apps.googleusercontent.com");

    try{
      var result= await _googlesignin.signIn();
      googleSignInAccount = result;
      if (result != null){
        print("Signed in as: ${result}");
        print("Signed in as: ${result.displayName}");
        print("image link: ${result.photoUrl}");
        print("Email-id: ${result.email}");
        print("Authentication id: ${result.serverAuthCode}");
        print("${result.id}");

        print("mydata $googleSignInAccount");
        print("google signin methood successful access");
       
        // setuserData();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Login'),),);
         Navigator.push(context, MaterialPageRoute(builder: ((context) => 
         Responsive_layout(
            mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
            tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
            desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount)))));
       }
       else{
        print("Signin-canceled");
       }
      
    }catch (error){
      print(error);
    }

  }

  // final _googleSignIn = GoogleSignIn();
  // Future<void> GoogleSignOut() async {
  // try {
  //   await _googleSignIn.signOut();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Logout'),),);
  //   } catch (error) {
  //   print("Error signing out: $error");
  //   }
  // }
  // String userEmail="";
  // String userName="";
  // static const String emailKey="Email";
  // static const String nameKey= "Name";
  //
  // void setuserData() async{
  //   SharedPreferences sharePref= await SharedPreferences.getInstance();
  //   sharePref.setString(emailKey,googleSignInAccount.email);
  //   sharePref.setString(nameKey, googleSignInAccount.displayName);
  //   sharePref.setBool('login_data',true);
  //   getuserData();
  // }
  //
  // void getuserData() async{
  //   SharedPreferences sharePref= await SharedPreferences.getInstance();
  //   userEmail=sharePref.getString(emailKey)??"no data ";
  //   userName=sharePref.getString(nameKey)??"no data";
  //   splashScreen.login_data=sharePref.getBool('login_data')?? false;
  //   print("now get bool value is ${splashScreen.login_data}");
  // }

  // GlobalKey  _formkey = GlobalKey();
  // TextEditingController email_ctrl= TextEditingController();
  // TextEditingController pswd_ctrl= TextEditingController();
  // String message="";

  // String? emailValidation(value ){
  //   if (value.isEmpty){return message="Email is required";}
  //   if (!emailRegEx.hasMatch(value)){return message="Invalid EmaiId";}

  // }

  // String? pswdValidation(value ){
  //   if (value.isEmpty){return message="password is required";}
  //   if (!pswdRegEx.hasMatch(value)){return message="Invalid Password";}

  // }
  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return Scaffold(

      body: Stack (
          children:[
            Container(
              height:mq.height,
              width:mq.width,
              child:Image.asset("images/greenbg.png.jpg",fit:BoxFit.fill,
            )),
            Center(
                child:Container(
                  height:380,
                  width:380,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Center(child:Image.asset("images/new.png",height:90,width:90)),
                        Center(child:textwidget("English AI",30, FontWeight.bold, Colors.green)),
                        SizedBox(height:20),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textwidget("Welcome to Learning with",18, FontWeight.w500,Colors.black),
                            SizedBox(width:5),
                            textwidget("English AI",18, FontWeight.bold,Colors.black),
                        ],
                        ),
      
                        SizedBox(height:40),
                        Center(child: textwidget("Continue with English AI",20, FontWeight.w600,Colors.black)),
      
                        SizedBox(height:40),
                        Center(
                          child:Container(
                              width:200,
                              // color: Color(0xFFF016A70),
                              child: ElevatedButton(onPressed: (){GoogleLogIn();},
                                  style:ElevatedButton.styleFrom(backgroundColor:Color(0xFFF64CCC5) ) ,
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Image.asset("images/google.png",height:16,width:21),
                                        SizedBox(width:15),
                                        textwidget("Login with Google",13, FontWeight.bold,Colors.white)
                                      ])
                              ),
                            ),
                          ),
      
                          // SizedBox(height:10),
                          //
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       GoogleSignOut();},
                          //     child: Text("Sign Out"),
                          //   ),
                          // )
      
                      
      
                      ]
                    ),
                  ),
                ))
          ]
        ),

    );
  }
}






