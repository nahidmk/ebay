class Student {
  String id;
  String name;
  String email;
  int age;
  String address;

  Student(
      {this.id = '',
      this.name = '',
      this.email = '',
      this.age = 0,
      this.address = ''});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      id: json["id"] as String,
      name: json["name"] == null ? '' : json["name"] as String,
      address: json["address"] == null ? '' : json["address"] as String,
      email: json["email"] == null ? '' : json["email"] as String,
    age: json['age']==null?0:json['age'] as int

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "email": email,
    "age": age,
  };

}
