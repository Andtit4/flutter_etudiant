class AdminModel {
  late String id_admin;
  late String email;
  late String nom;
  late String prenom;

  AdminModel(
      {required this.email,
      required this.nom,
      required this.prenom,
      required this.id_admin});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
        email: json['email'],
        nom: json['nom'],
        prenom: json['prenom'],
        id_admin: json['id_admin']);
  }
}
