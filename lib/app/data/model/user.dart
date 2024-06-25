import 'dart:convert';

class User {
  final String login;
  final String avatarUrl;
  final String? location;
  final String? name;
  final int? followers;
  final int? publicRepos;

  User({
    required this.login,
    required this.avatarUrl,
    this.location,
    this.name,
    this.followers,
    this.publicRepos,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'location': location,
      'name': name,
      'followers': followers,
      'public_repos': publicRepos,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'],
      avatarUrl: map['avatar_url'],
      location: map['location'],
      name: map['name'],
      followers: map['followers']?.toInt(),
      publicRepos: map['public_repos']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
