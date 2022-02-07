class People {
  final String? name;
  final DateTime? createdAt;
  final String? avater;
  final String? id;
  People({this.name, this.createdAt, this.avater, this.id});

  factory People.fromJson(Map<String, dynamic> people) {
    return People(
      id: people["id"],
      name: people["name"],
      createdAt: DateTime.parse(people["createdAt"]),
      avater: people['avatar'],
    );
  }
}
