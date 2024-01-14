
import "dart:convert";

import "package:flutter/material.dart";
import 'package:speech_to_text/speech_to_text.dart' as stt;

import "../api_function/model.dart";
import 'package:http/http.dart' as http;


class bottomScreen extends StatefulWidget {
  // const bottomScreen({super.key,required this.article_name_in});

  // final int article_name_in;

  @override
  State<bottomScreen> createState() => bottomScreenState();
}

class bottomScreenState extends State<bottomScreen> {


  int  article_name_in=0;
  int btn_index=0;
  bool _isListening=false;
  final stt.SpeechToText _speech=stt.SpeechToText();
  String _text="";
  List<String> heyspeak=[];
  int selected_index=1;






  void ontapped(index){
    setState(() {
      btn_index=index;
    });
    if (btn_index==0){
      previous_article();
    }
    else{
      next_article();
    }
  }

  void previous_article(){
    setState(() {
      if (article_name_in<4){
        article_name_in++;}
    });

  }


  void next_article(){
    setState(() {
      if (article_name_in>0){
        article_name_in--;}
    });
  }


  Future <void> _initializeSpeech()async{
    await _speech.initialize(
        onStatus : (status){
          print("Speech recongnition status: $status");
        });

  }

  List availablecontent=["article 1","article 2","article 3","article 4","level 1","level 2","level 3","level 4","level 5"];

  Future<void> _startListening() async {
    if (!_isListening) {

      bool available = await _speech.initialize();

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords.toLowerCase();

              heyspeak = _text.split(' ');
              // print("$heyspeak yes");

              if (_text.contains("level 1")) {
                setState(() {
                  selected_index = 1;
                });
              } else if (_text.contains("level 2")) {
                setState(() {
                  selected_index = 2;
                });
              } else if (_text.contains("level 3")) {
                setState(() {
                  selected_index = 3;
                });
              } else if (_text.contains("level 4")) {
                setState(() {
                  selected_index = 4;
                });
              } else if (_text.contains("level 5")) {
                setState(() {
                  selected_index = 5;
                });
              }


              // Check recognized voice command and change the topic

              else if (_text.contains("article 1")){
                setState(() {
                  article_name_in=0;
                });
              } else if (_text.contains("article 2")){
                setState(() {
                  article_name_in= 1;
                });


              }else if (_text.contains("article 3")){
                setState(() {
                  article_name_in=2;
                });


              }else if (_text.contains("article 4")) {
                setState(() {
                  article_name_in = 3;
                });
              }
              // }else if (!availablecontent.contains(_text)){
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text('invalid content'),
              //
              //     ),
              //   );
              // }

            });

          },

        );
      }

    }
  }

  // Set<String> voiceset= Set<String>();
  // voiceset.addAll(heyspeak);

  Future<void> _stopListening() async {
    if (_isListening) {
      setState(() {
        // heyspeak.add(_text);
        _isListening = false;
      });
      await _speech.stop();
    }
  }

  List<Article_Model> article_content=[];
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://merd-api.merakilearn.org/englishAi/content'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['articles'] as List<dynamic>;

        setState(() {
          article_content = jsonData
              .map((data) => Article_Model.fromJson(data as Map<String, dynamic>))
              .toList();
        });



      } else {
        // Handle error if the API request fails.
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;

    return Scaffold(

      bottomNavigationBar:
        Container(height: 60,width:mq.width
            ,child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  InkWell(onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
                  InkWell(onTap: (){
                    setState(() {

                      if(_isListening){
                        _stopListening();
                      }else{
                        _startListening();
                      }
                    });
                  },child: Image.asset( _isListening ? 'images/offmicrophone.png' : 'images/microphone.png',
                    height: 40,
                    width: 40,),),
                  InkWell(onTap: (){setState((){if(article_name_in<article_content.length-1){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35)),
                  // InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>article_names(article_content: article_content)));},child:Text("Content",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),))
                ])),

      // bottomNavigationBar:
      // BottomNavigationBar(
      //   selectedFontSize: 10.0,
      //   iconSize: 10.0,
      //   currentIndex:btn_index,
      //   onTap: ontapped,
      //   items: [
      //     BottomNavigationBarItem(icon:Image.asset("images/left-arrow.png",height: 10.0),label:(""),backgroundColor: Colors.black,),
      //     BottomNavigationBarItem(icon:Image.asset("images/microphone.png",height: 8.0,),label: ("")),
      //     BottomNavigationBarItem(icon:Image.asset("images/right-arrow-black-triangle.png",height: 10,),label:(""),backgroundColor: Colors.black,),
      //   ],
      //
      // ),

    );
  }
}





