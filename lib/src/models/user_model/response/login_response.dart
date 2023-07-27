
class LoginResponse {
  final String? userId;
  const LoginResponse({
    this.userId,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json["userId"],
    );
  }
}
