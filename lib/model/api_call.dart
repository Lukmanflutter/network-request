class StudentModel {
 final int? userId;
  final int? id;
  final String? title;
  StudentModel({ this.userId,  this.title, this.id});
  
  factory StudentModel.fromJason(Map <String, dynamic> json){
   return StudentModel(userId:json["userId"],id:json["id"],
   title:json["title"]);
  }
}