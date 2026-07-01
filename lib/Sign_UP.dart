import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

// ignore: camel_case_types
class _Sign_UpState extends State<Sign_Up> {
  bool pas=true;
  bool conpas=true;
  TextEditingController emailController=TextEditingController();
    TextEditingController passController=TextEditingController();


  String ? pass;
  GlobalKey <FormState>formstate=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SafeArea(child: Stack(
        children: [
          Positioned(top: -50,left: -50,
          child: Container(width: 150,height: 150,
          // ignore: deprecated_member_use
          decoration: BoxDecoration(color: Color(0xFF8AF3F3).withOpacity(0.5),shape: BoxShape.circle),

          ),
          ),
          Positioned(top: -100,left: 0,
            child: Container(width: 150,height: 150,decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Color(0xFF8AF3F3,).withOpacity(0.5),
            shape: BoxShape.circle
          ),)),
          SafeArea(child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 100,),
                  Text("        welcome onboard!  ",style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,


                  ),),
                  SizedBox(height: 5,),
                  Text("        Let’s help you meet up your tasks  ",style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 19,
                    //fontWeight: FontWeight.bold,


                  ),),
                  Form(key: formstate,
                  child: Column(
                    children: [

                      Padding(
                        padding: const  EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return"Invalid this fild";
                            }
                            return null;
                            
                          },
                          decoration: InputDecoration(
                             prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.grey,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                           // labelText: "Enter Your Full Name"
                           hintText: "Enter Your Full Name",
                           hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                           border: OutlineInputBorder(borderSide: BorderSide.none,
                           borderRadius: BorderRadius.circular(40),

                           )
                          ),
                        ),
                      ),

                     // SizedBox(height: 10,),

                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                             if(value!.isEmpty){
                              return"Pleas Enter Your E-mail";
                            }

                            if(!value.endsWith("@gmail.com")){
                              return"E-mail@gmail.com";
                            }
                            return null;
                            
                          },
                          decoration: InputDecoration(
                             prefixIcon: Icon(Icons.email),
                          prefixIconColor: Colors.grey,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                           // labelText: "Enter Your Full Name"
                           hintText: "Enter Your Email",
                           hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                           border: OutlineInputBorder(borderSide: BorderSide.none,
                           borderRadius: BorderRadius.circular(40),

                           )
                          ),
                        ),
                      ),

                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                        child: TextFormField(
                          controller: passController,
                          obscureText: pas,
                          validator: (value) {
                            pass=value;
                             if(value!.isEmpty){
                              return"Pleas Enter Your Password";
                            }

                            if(value.length<8){
                              return"Password must contain at least 8 characters";
                            }
                            return null;
                            
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: ()
                            {
                              setState(() {
                                pas=!pas;
                              });

                            }, icon: Icon(pas?Icons.visibility_off : Icons.visibility,color: Colors.grey,)),
                             prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.grey,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                           // labelText: "Enter Your Full Name"
                           hintText: "Enter Password",
                           hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                           border: OutlineInputBorder(borderSide: BorderSide.none,
                           borderRadius: BorderRadius.circular(40),

                           )
                          ),
                        ),
                      ),

                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                        child: TextFormField(
                          obscureText: conpas,
                          validator: (value) {
                            
                             if(value!.isEmpty){
                              return"Pleas Enter Your Password";
                            }

                            if(value!=pass){
                              return"Password Don't Match";
                            }
                            return null;
                            
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: ()
                            {
                              setState(() {
                                conpas=!conpas;
                              });

                            }, icon: Icon(conpas?Icons.visibility_off : Icons.visibility,color: Colors.grey,)),
                             prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.grey,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                           // labelText: "Enter Your Full Name"
                           hintText: " Conform password",
                           hintStyle: TextStyle(fontSize: 19,color: Color(0xFF000000)),
                           border: OutlineInputBorder(borderSide: BorderSide.none,
                           borderRadius: BorderRadius.circular(40),

                           )
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),

                      ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF63FFF8),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 105),
                     // side: BorderSide(style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),onPressed: () async {
                        if(formstate.currentState!.validate()){
                         /* try {
                         // ignore: unused_local_variable
                         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                               email:emailController.text.trim() ,
                               password:passController.text ,
                             );
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Sign_in()));
                              } on FirebaseAuthException catch (e) {
                             if (e.code == 'weak-password') {
                             // ignore: avoid_print
                             print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              // ignore: avoid_print
                              print('The account already exists for that email.');
                            }
                            } catch (e) {
                             // ignore: avoid_print
                             print(e);
                            }*/
                            try{
                             // ignore: unused_local_variable
                             final credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text.trim(), 
                              password: passController.text);
                              await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                              AwesomeDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                               dialogType: DialogType.infoReverse,
                               animType: AnimType.topSlide,
                                title: 'info',
                               desc: 'Please activate your account using the link sent to your email.',
                               // btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Sign_in()));
                                },
                               ).show();

                             
                               

                            }on FirebaseAuthException catch(e)
                            {
                              if(e.code=='weak-password')
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                               Text("The password provided is too weak.",style: TextStyle(color: Color.fromARGB(255, 255, 254, 254),
                               fontSize: 17,
                               ),
                               ),
                               backgroundColor: Color.fromARGB(255, 229, 5, 5),
                               duration: Duration(seconds: 5),
                               ));
                                // ignore: avoid_print
                               // print('The password provided is too weak.');
                              }
                              else if(e.code=='email-already-in-use')
                              {

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                               Text("The account already exists for that email.",style: TextStyle(color: Color.fromARGB(255, 255, 254, 254),
                               fontSize: 17,
                               ),
                               ),
                               backgroundColor: Color.fromARGB(255, 229, 5, 5),
                               duration: Duration(seconds: 5),
                               ));
                                // ignore: avoid_print
                               // print('The account already exists for that email.');
                              }

                            }
                            catch(e)
                            {
                              // ignore: avoid_print
                              print(e);
                            }
                         

                        }
                       

                      }, child: Text("Register", style: TextStyle(fontSize: 25,color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,))),

                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account ?",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          TextButton(onPressed: (){
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Sign_in()));

                          }, child: Text("sign in",
                          style: TextStyle(
                            color:Color(0xFF02BCB4),
                            fontSize: 25,
                            fontWeight: FontWeight.bold 
                          ),
                          ))
                        ],
                      ),
                      SizedBox(height: 10,)

                      




                    ],
                  ))
                  
                ],

              )
            ],
          ))
        ],

      )),
    );

  }
}