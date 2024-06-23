class Task{
  String name;
  String description;
  String id;
  int date_in_milliSecond;
  bool isDone;

  Task({required this.name,required this.description, this.id = '',required this.date_in_milliSecond,
    this.isDone=false});
  Task.fromJson(Map<String,dynamic> json) : this(
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      date_in_milliSecond: json['date_in_milliSecond'] as int,
      isDone: json['isDone'] as bool
    );

  Map<String,dynamic> toJson(){
    return {
      "name" : name,
      "description" : description,
      "id" : id,
      "date_in_milliSecond" : date_in_milliSecond,
      "isDone" : isDone
    };
  }
}