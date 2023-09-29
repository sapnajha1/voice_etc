



//   API   MODEL

class Article_Model{
  late String title;
  late String level1;
  late String level2;
  late String level3;
  late String level4;
  late String level5;
  

  Article_Model({r,required this.title,required this.level1,required this.level2,required this.level3, required this.level4, required this.level5});

  factory Article_Model.fromJson(Map<dynamic,dynamic> json){
    return Article_Model(
      title:  json['title'] as String ,
      level1: json['level1'] as String , 
      level2: json['level2'] as String , 
      level3: json['level3'] as String , 
      level4: json['level4'] as String , 
      level5: json['level5'] as String ,
    //   factory Article_Model.fromJson(Map<String, dynamic> json) {
  // Map<String, dynamic>? idMap = json['id'] as Map<String, dynamic>?;

  // return Article_Model(
  //   title: json['title'] as String,
  //   level1: json['level1'] as String,
  //   level2: json['level2'] as String,
  //   level3: json['level3'] as String,
  //   level4: json['level4'] as String,
  //   level5: json['level5'] as String,
    // id:Map<String,int>.from(json['id'as Map]),
    // id: idMap != null ? Map<String, int>.from(idMap) : <String, int>{},
  );
}
      
  
}

class UserData {
  final String usersReading;
  final int level;
  final int englishAiContentId;
  // final int id;

  UserData({
    required this.usersReading,
    required this.level,
    required this.englishAiContentId,
    // required this.id,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      usersReading: json['users_reading'] as String,
      level: json['level'] as int,
      englishAiContentId: json['english_ai_content_id'] as int,
      // id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users_reading': usersReading,
      'level': level,
      'english_ai_content_id': englishAiContentId,
      // 'id': id,
    };
  }
}





 
