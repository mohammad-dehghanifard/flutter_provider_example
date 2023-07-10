class TodoModel{
   int? userId;
   int? id;
   String? title;
   bool? completed;

  TodoModel(this.userId, this.id, this.title, this.completed);

  TodoModel.formJson(Map<String,dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json["completed"];
  }
}
