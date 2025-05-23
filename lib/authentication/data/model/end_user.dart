import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory EndUser.fromJson(Map<String, dynamic> json, {required String id}) {
    return EndUser(
      id: id,
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }

  EndUser copyWith({String? name, String? email, String? password}) {
    return EndUser(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [id, name, email, password];
}
