class JobModel {
  final String company;
  final String title;
  final String description;
  final String image;
  final String location;
  final String salary;
  final List<String> tags;

  JobModel({
    required this.company,
    required this.image,
    required this.title,
    required this.description,
    required this.location,
    required this.salary,
    required this.tags,
  });

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      company: map['name'] as String,
      title: map['title'] as String,
      description: map['desc'] as String,
      image: map['img'] as String,
      location: map['location'] as String,
      salary: map['value'] as String,
      tags: List.from(map['tags']),
    );
  }
}
