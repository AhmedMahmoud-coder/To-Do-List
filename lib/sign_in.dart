import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sign_UP.dart';
import 'package:flutter_application_1/first.dart';


// ignore: camel_case_types
class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

// ignore: camel_case_types
class _Sign_inState extends State<Sign_in> {
  bool pass=true;
TextEditingController emailController=TextEditingController();
TextEditingController passController=TextEditingController();
  GlobalKey<FormState>formstate=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFE6E6E6),
       body: SafeArea(child: Stack(
        children: [
          Positioned(top: -50,left: -50,
            child: Container(width: 150,height: 150,decoration: BoxDecoration(
            shape: BoxShape.circle,
            // ignore: deprecated_member_use
            color: Color(0xFF8AF3F3).withOpacity(0.5)

          ),)),

           Positioned(top: -100,left: 0,
            child: Container(width: 150,height: 150,decoration: BoxDecoration(
            shape: BoxShape.circle,
            // ignore: deprecated_member_use
            color: Color(0xFF8AF3F3).withOpacity(0.5)

          ),)),
          SafeArea(child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 100,),
                  Text("        welcome Back  ",style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 50,),
                  Center(child: Image.asset("images/undraw_my.png")),
                  SizedBox(height: 12,),
                  Form(key: formstate
                    ,child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                      child: Column(
                        children: [
                          TextFormField(
                            
                            controller: emailController,
                            
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return "Please Enter Your E-mail";
                              }
                              if(!value.endsWith("@gmail.com"))
                              {
                                return "E-mail@gmail.com";
                              }
                              return null;
                              
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Colors.grey,
                          
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              hintText: " Enter your email",
                              hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none
                              )
                            ),
                          
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50)),

                       

                     TextFormField(
                        
                        controller: passController,
                        obscureText: pass,
                        
                        
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                             return "Please Enter Password";

                          }
                          if(value.length<8)
                          {
                            return "Must password contain 8 character";
                          }
                          return null;
                          
                        },

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.grey,
                          
                          suffixIcon:IconButton(onPressed: (){
                            setState(() {
                              pass=!pass;
                            });
                            
                          }, icon: Icon(pass?Icons.visibility_off : Icons.visibility,color: Colors.grey,)),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
                          hintText: " Enter password",
                          hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none
                          )
                        ),
                      
                      ),
                    
                    SizedBox(height: 10,),
                    TextButton(onPressed: ()
                      async{
                        if(!emailController.text.trim().isEmpty)
                        {
                          try{
                            await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                            if(!mounted)return;
                            AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.infoReverse,
                               animType: AnimType.topSlide,
                                title: 'Info',
                               desc: 'To change your password, please go to your email.',
                                btnCancelOnPress: () {
                                  return null;
                                },
                                btnOkOnPress: () {
                                },
                               ).show();


                          }on FirebaseAuthException catch(e)
                          {
                            if(e.code=="user-not-found")
                            {
                               AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.error,
                               animType: AnimType.topSlide,
                                title: 'Error',
                               desc: 'No user found for this email. Please enter a valid registered email.',
                                
                                btnOkOnPress: () {
                                },
                                btnOkColor: Color.fromARGB(255, 225, 13, 13)
                               ).show();

                            }
                            else if(e.code=="invalid-email")
                            {
                               AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.warning,
                               animType: AnimType.topSlide,
                                title: 'Warning',
                               desc: 'The email address is badly formatted.',
                                
                                btnOkOnPress: () {
                                },
                               ).show();


                            }
                            else
                            {
                               AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.error,
                               animType: AnimType.topSlide,
                                title: 'Error',
                               desc:e.message?? 'An error occurred. Please try again.',
                                
                                btnOkOnPress: () {
                                },
                                btnOkColor: Color.fromARGB(255, 225, 13, 13)
                               ).show();

                            }

                          }
                           

                        }
                        else{
                           AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.error,
                               animType: AnimType.topSlide,
                                title: 'Error',
                               desc: 'Please Enter your E-mail first!',
                                //btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                                btnOkColor: Color.fromARGB(255, 252, 6, 6)
                               ).show();
                        }
                     
                    }, child: Text("  Forget password  ",style: TextStyle(color: Color(0xFF02BCB4),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    ),),),
                    SizedBox(height: 10,),
                    ElevatedButton(style:ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF63FFF8),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 105),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                    )
                      ,onPressed: ()async{
                        if(formstate.currentState!.validate())
                        {
                          try{
                             // ignore: unused_local_variable
                             final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                             password: passController.text);
                             if(FirebaseAuth.instance.currentUser!.emailVerified)
                             {
                              AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.success,
                               animType: AnimType.topSlide,
                                title: 'Success',
                               desc: 'Login successful.',
                              //  btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>First()));

                                },
                               ).show();
                               

                              // ignore: use_build_context_synchronously
                             

                             }else
                             {
                               AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.warning,
                               animType: AnimType.topSlide,
                                title: 'Warning',
                               desc: 'Please activate your account using the link sent to your email.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                               ).show();
                             

                             }
                             

                          }on FirebaseAuthException catch(e)
                          {
                            if(e.code == 'invalid-credential')
                            {
                              /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                               Text("Incorrect email or password.",style: TextStyle(color: Color.fromARGB(255, 255, 254, 254),
                               fontSize: 17,
                               ),
                               ),
                               backgroundColor: Color.fromARGB(255, 229, 5, 5),
                               duration: Duration(seconds: 5),
                               ));*/
                               // ignore: avoid_print
                              // print('No user found for that email.');


                              AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.error,
                               animType: AnimType.topSlide,
                                title: 'Error',
                               desc: 'Incorrect email or password.',
                                btnOkOnPress: () {},
                                btnOkColor: Color.fromARGB(255, 255, 3, 3)
                               ).show();
                            }
                            /* else if (e.code == 'wrong-password') {
                               // ignore: avoid_print
                               print('Wrong password provided for that user.');

                               }*/
                          }
                         


                        }


                    }, child: Text("Login", style: TextStyle(fontSize: 25,color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,))),

                      SizedBox(height: 10,),
                      
                      FittedBox(
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("  Don’t have an account ?",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            TextButton(onPressed: (){
                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Sign_Up()));
                        
                            }, child: Text(" sign up",
                            style: TextStyle(
                              color:Color(0xFF02BCB4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold 
                            ),
                            ))
                        
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                       ],
                      ),
                    )
                  ),


                ],
              )
            ],
          ))
          
        ],
       )),
    );
  }
}