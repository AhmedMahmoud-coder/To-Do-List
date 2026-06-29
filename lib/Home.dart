import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sign_UP.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(child: Stack(
                
        children: [
          Positioned(top: -50,
          left: -50,
          child:  Container(width: 200,height: 200,
          decoration: BoxDecoration(shape: BoxShape.circle,
          // ignore: deprecated_member_use
          color: Color(0xFF8AF3F3).withOpacity(.5),

          ),
          
          ),
          ),
          Positioned(top: -100,left: 0,child:Container(width: 200,height: 200,
          decoration: BoxDecoration(shape: BoxShape.circle,
          // ignore: deprecated_member_use
          color: Color(0xFF8AF3F3).withOpacity(.5),

          ),

          
          ), ),
          
         SafeArea(child: ListView(
           children: [
             Column(
              //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Center(child: Image.asset("images/undraw.png"),),
                  SizedBox(height: 50,),
                  Text("Gets things done with TODO",style: TextStyle(color:Color(0xFF000000),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    // ignore: deprecated_member_use
                    Shadow(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    )
                  ]
                  ),),
                  SizedBox(height: 50,),
                  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40.0), 
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentestque tellus vitoe neque,sed duis nec eget et,ouctor.Penatibus.",
                    textAlign: TextAlign.center,
                     style: TextStyle(
                      color:Color(0xFF000000),
                      fontSize: 18, 
                       height: 1.5,
                         ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Sign_Up(),));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF63FFF8),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 105),
                     // side: BorderSide(style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ), child: Text("Get Started",
                      style: TextStyle(fontSize: 25,color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      )


                ],
              ),
           ],
         ))
           
         
          

        ],
      ),

      ),

    );

  }
}