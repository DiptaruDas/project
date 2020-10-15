class UserDetails {
  String name;
  String age;
  UserDetails(this.name, this.age);
  Map<String, String> toJason() => {"name": name, "age": age};
}
