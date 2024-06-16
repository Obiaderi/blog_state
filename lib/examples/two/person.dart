class Person {
  int? id;
  String? name;
  String? email;
  int? age;
  String? occupation;
  String? location;

  Person(
      {this.id,
      this.name,
      this.email,
      this.age,
      this.occupation,
      this.location});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      occupation: json['occupation'],
      location: json['location'],
    );
  }

  @override
  String toString() {
    return 'Person(id: $id, name: $name, email: $email, age: $age, occupation: $occupation, location: $location)';
  }
}
