class userData {
  final int id;
  final String name;
  final int age;

  const userData({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'userData{id: $id, name: $name, age: $age}';
  }

}