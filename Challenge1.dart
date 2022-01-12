import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  
  Widget build(BuildContext context){
    return MaterialApp(
      home:CurvyLorem(),
    );
  }
}

class CurvyLorem extends StatelessWidget{
  var loremipsum="""Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sodales molestie leo sed posuere. Nam id quam dolor. Nunc non augue ut metus maximus dictum sit amet ac urna. Pellentesque augue arcu, condimentum eu purus sit amet, semper ultrices lacus. Aenean maximus lectus vitae nibh tempor, sit amet lobortis mi porttitor. Nulla facilisi. Integer facilisis tincidunt condimentum.

Maecenas placerat velit ut risus tristique, nec posuere lectus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi convallis semper turpis, hendrerit volutpat mi tempus hendrerit. Donec sit amet massa varius, fermentum lacus sit amet, sagittis ante. Vivamus hendrerit, lorem vel sodales consectetur, urna ante semper metus, eget tincidunt risus felis nec ex. Donec vitae viverra metus. Aenean gravida vehicula risus. Fusce non gravida quam. Integer sit amet ullamcorper leo, in consequat odio. Cras interdum ex venenatis ligula accumsan, et iaculis quam ullamcorper. Proin vitae augue nec nisl porttitor rutrum eget ut ex. Aliquam dapibus vehicula ullamcorper.

Donec ac vulputate justo. """;
  Widget build(BuildContext context){
    var size=MediaQuery.of(context).size;
    return Scaffold(body:Container(
      height:size.height,
      width:size.width,
        color:Colors.purple,
      child:CustomPaint(painter:CurvePainter(),
                       child:Column(crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children:[
                         Container(height:130,child:Text("Lorem Ipsum",style:TextStyle(fontSize:65))),
                         Expanded(child:Container(child:Text(loremipsum,style:TextStyle(fontSize:20)))),             
                       ])),
      ),);
    
  }
}

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint paint=Paint();
    paint.color=Colors.grey;
    paint.style=PaintingStyle.fill;
    Path path  = Path();
    path.lineTo(0,100);
    path.quadraticBezierTo(size.width*.25,130,size.width*0.5,100);
    path.quadraticBezierTo(size.width*.75,70,size.width,100);
    path.lineTo(size.width,0);
    canvas.drawPath(path,paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}
