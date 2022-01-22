import 'package:flutter/material.dart';
import 'dart:math' as math;
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(home:Clock());
  }
}

class Clock extends StatelessWidget{
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text("Clock")),
      floatingActionButton:FloatingActionButton(
        onPressed:(){},
        child:Icon(Icons.refresh),
      ),
      body:Center(child:Container(
          height:200,
          width:200,
        padding:EdgeInsets.all(5),
        decoration:BoxDecoration(
          shape:BoxShape.circle,
          color:Colors.black,
        ),
        child:Container(
          
        decoration:BoxDecoration(
          shape:BoxShape.circle,
          
          color:Colors.grey,
          //borderRadius:BorderRadius.all(),
          gradient:LinearGradient(
            colors:[
              Color.fromRGBO(223,223,223,1),
              Color.fromRGBO(168,168,168,1)
            ],
            transform:GradientRotation(math.pi/4),
          ),
        ),
          child:Stack(
          children:[
            Center(child:
            Container(
              height:15,
              width:15,
       
            decoration:BoxDecoration(shape:BoxShape.circle,color:Colors.black),
            ),
            ),
  
            Container(
              height:double.infinity,
              width:double.infinity,
              padding:EdgeInsets.all(5),
            decoration:BoxDecoration(shape:BoxShape.circle),
              child:RepaintBoundary( // RepaintBoundary avoids unnecessary repaints of ancestor widgets and child widget in case other widget repaints
              child:Stack(
                fit:StackFit.expand, // provides as much space possible to stack
                children:[CustomPaint(painter:DialPainter()),
                          CustomPaint(painter:NumPainter()),
                         ],
                )
              ),
            ),
            
          ],
          ),
      )
      )
      
      )
      
    );
  }
  
}

class DialPainter extends CustomPainter{
  
  void paint(Canvas canvas, Size size){
    Paint paint=Paint();
   // canvas.save();
    double radius=size.width/2;
    paint.color=Colors.black;
    canvas.translate(size.width/2,size.width/2); // moving to center
    var angle=(2*math.pi/60);
    for(var i=1;i<=60;i++){
      canvas.rotate(angle);
      if(i%5==0){
        paint.strokeWidth=3;
    canvas.drawLine(Offset(0,-radius),Offset(0,-radius+8),paint);
      }
      else{
        paint.strokeWidth=1;
        canvas.drawLine(Offset(0,-radius),Offset(0,-radius+5),paint);
      }
      
    }
  //  canvas.restore();
  }
  
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}

class NumPainter extends CustomPainter{
  void paint(Canvas canvas, Size size){
    TextPainter textPainter = TextPainter(textDirection:TextDirection.ltr);
    double radius=size.width/2;
     canvas.translate(radius,radius);
    double angle=(2*math.pi/12);
    for(var i=1;i<=12;i++){
      
      canvas.rotate(angle);
      canvas.save();
      canvas.translate(0,-radius+20);
      canvas.rotate(-angle*i);
     textPainter.text= TextSpan(text:"${i}",style:TextStyle(fontSize:10));
    textPainter.layout(); //Computes the visual position of the glyphs for painting the text.
     textPainter.paint(canvas,Offset(-textPainter.width/2,-textPainter.height/2));
      canvas.restore();
      //canvas.rotate(angle);
    }
  
  }
   bool shouldRepaint(CustomPainter oldDelegate){
     return false;
   }
}
