class UserModel {
  final String name;
  final int id;
  final List<String> tehs;
  final bool? isAdmin;

  const UserModel(
    this.name,
    this.id,
    this.tehs,
    this.isAdmin,
  );
}
