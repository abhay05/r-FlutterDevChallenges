import 'package:flutter/material.dart';
import 'dart:math' as math;
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(home:Clock());
  }
}

class Clock extends StatelessWidget{
  
  List<Widget> getPost(){
    List<Widget> arr=[];
    for(int i=1;i<=60;i++){
      if(i%5==0){
        arr.add(Positioned(left:100+93*math.sin(((2*math.pi)/60)*i),top:100-93*math.cos(((2*math.pi)/60)*i),child:Transform( transform: Matrix4.skewY(0)..rotateZ((2*math.pi / 60)*i),alignment: FractionalOffset.center,child:Container(height:8,width:3,color:Colors.black,),),));
      }else{
      arr.add(Positioned(left:100+93*math.sin(((2*math.pi)/60)*i),top:100-93*math.cos(((2*math.pi)/60)*i),child:Transform( transform: Matrix4.skewY(0)..rotateZ((2*math.pi / 60)*i),alignment: FractionalOffset.center,child:Container(height:5,width:1,color:Colors.black,),),),);
      }
      }
    return arr;
  }
  List<Widget> getHours(){
    List<Widget> arr=[];
    for(int i=1;i<=60;i++){
      if(i%5==0){
        arr.add(Positioned(left:100+75*math.sin(((2*math.pi)/60)*i),top:100-75*math.cos(((2*math.pi)/60)*i),child:Transform( transform: Matrix4.skewY(0)..rotateZ((2*math.pi / 60)*i),alignment: FractionalOffset.center,child:Text((i/5).toString(),style:TextStyle(fontSize:10)),),));
      }
      }
    return arr;
  }
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child:Container(
          height:210,
          width:210,
          decoration:BoxDecoration(
          //  color:Colors.grey,
            borderRadius:BorderRadius.circular(200),
            border:Border.all(color:Colors.black,width:5),
//             gradient:LinearGradient(
//               begin:Alignment.topLeft,
//               end:Alignment.bottomRight,
//               colors:[
//                 Color(0xfff5f5f5),
//                // Color(0xffebebeb),
//                // Color(0xffe0e0e0),
//                 //Color(0xffd6d6d6),
//                 //Color(0xffcccccc),
//               //  Color(0xffc2c2c2),
//                // Color(0xffb8b8b8),
//                 Color(0xffadadad)
//               ],
//              ),
          ),
          child:Stack(children:[
            
            Transform( transform: Matrix4.skewY(0)..rotateZ(-math.pi / 5.0),
                          alignment: FractionalOffset.center,
                          child:ClipOval(child:Column(
            children:[
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffebebeb),border:Border(bottom:BorderSide(color:Color(0xffe0e0e0),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffe0e0e0),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffe0e0e0),border:Border(bottom:BorderSide(color:Color(0xffd6d6d6),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffd6d6d6),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffd6d6d6),border:Border(bottom:BorderSide(color:Color(0xffcccccc),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffcccccc),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffcccccc),border:Border(bottom:BorderSide(color:Color(0xffc2c2c2),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffc2c2c2),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffc2c2c2),border:Border(bottom:BorderSide(color:Color(0xffb8b8b8),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffb8b8b8),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffb8b8b8),border:Border(bottom:BorderSide(color:Color(0xffadadad),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffadadad),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              Container(width:200,height:200/7,decoration:BoxDecoration(color:Color(0xffadadad),border:Border(bottom:BorderSide(color:Color(0xffd6d6d6),width:1)),
                       boxShadow:[BoxShadow(color:Color(0xffd6d6d6),spreadRadius:0,blurRadius:3,offset: Offset(0, 2.0),),],),),
              
            ]
          ),
          clipper: MyClip(),
         ),
        ),
         Positioned(top:95,left:95,child:
                   Stack(children:[
                     Container(height:10,width:10,decoration:BoxDecoration(color:Colors.black,borderRadius:BorderRadius.circular(10),),),
                  ])
                   ),
         ...getPost(),
         ...getHours(),   
                    
        ],),
        ),
        
      ),
    );
  }
}

// custome clipper refactor the code
class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 200, 200);
  }
 
  bool shouldReclip(oldClipper) {
    return false;
  }
}
