class CreateUserModel {
  final String name;
  final String job;
  final String? lastName;
  final String? middleName;

  CreateUserModel({
    required this.name,
    this.lastName,
    this.middleName,
    required this.job,
  });
}




