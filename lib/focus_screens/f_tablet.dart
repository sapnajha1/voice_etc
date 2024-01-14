
import 'package:englishetc_voice_ai/components/Article.dart';
import 'package:englishetc_voice_ai/components/Focus.dart';
import 'package:englishetc_voice_ai/const/color.dart';
import 'package:flutter/material.dart';
import '../constWidget/textwidget.dart';


class f_tabletPage extends StatefulWidget {


  f_tabletPage({required this.article_name_in,required this.article_content, required this.selected_index,required this.selected_index2,required this.fontsize});
  int article_name_in;
  int selected_index;
  int selected_index2;
  List article_content;
  double fontsize;
  @override
  State<f_tabletPage> createState() => _f_tabletPageState();
}

class _f_tabletPageState extends State<f_tabletPage> {
 



  @override
  Widget build(BuildContext context) {
    
    var mq= MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child:
          SingleChildScrollView(physics:AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Article_image(height:mq.height*0.15,width:mq.width*0.20, imgurl: '',),
                      const SizedBox(width:25),
                      Flexible(child: textwidget(widget.article_content[widget.article_name_in].title,25, FontWeight.bold, textcolor)),
                      //  const SizedBox(width:30)

                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      InkWell(onTap:(){Navigator.pop(context);}, 
                      child: Focas_container(focustext:"Exit from Focus Mode",fontsize:15,)),
                      // height:mq.height* 0.050,width:mq.width*0.280,
                const SizedBox(width:100),
                      Row(
                          children:[
                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            widget.selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {widget.selected_index2=1;widget.fontsize=18;});},
                                child: textwidget("A", 18, FontWeight.w700, Colors.black)),

                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            widget.selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {widget.selected_index2=2;widget.fontsize=20;});},
                                child: textwidget("A", 20, FontWeight.w700, Colors.black)),
                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            widget.selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {widget.selected_index2=3;widget.fontsize=25;});},
                                child: textwidget("A",23, FontWeight.w700, Colors.black)),

                          ]),

                      ]),
                    

                  // LEVEL ROW

                  const SizedBox(height:20),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width:mq.width*0.750,
                            height:mq.height*0.07,

                            // LEVEL TEXT
                            child:Padding(
                              padding: const EdgeInsets.only(left:20.0,right:20.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    textwidget("Level",30, FontWeight.bold, menu),
                                    SizedBox(width:30),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER

                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==1?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),

                                              onPressed:(){setState(() {widget.selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==2?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {widget.selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==3?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {widget.selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==4?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {widget.selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==5?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {widget.selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                    // ),

                                  ]),
                            ))

                      ]),
                  SizedBox(height:20),

                  // ARTICLE CONTENT

                  Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child:((){
                              if (widget.selected_index==1){
                                return  textwidget(widget.article_content[widget.article_name_in].level1,widget.fontsize, FontWeight.w200, Colors.black,);
                                }
                              else if (widget.selected_index==2){
                                return textwidget(widget.article_content[widget.article_name_in].level2,widget.fontsize, FontWeight.w200, Colors.black,);
                              }
                              else if (widget.selected_index==3){
                               return textwidget(widget.article_content[widget.article_name_in].level3,widget.fontsize, FontWeight.w200, Colors.black,);
                              }
                              else if (widget.selected_index==4){
                              return textwidget(widget.article_content[widget.article_name_in].level4,widget.fontsize, FontWeight.w200, Colors.black,);
                             }
                             else{
                              return textwidget(widget.article_content[widget.article_name_in].level5,widget.fontsize, FontWeight.w200, Colors.black,);
                             }
                             
                             })()
                            )
                          )

                ], ),




            ),
          ),
          ),



        ],
      ),
    );
  }
}
