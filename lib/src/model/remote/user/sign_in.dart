/// [SignInRequest] this class request when sign in
class SignInRequest {
  ///
  SignInRequest({this.username = '', this.password = ''});

  /// username of user
  late final String username;

  /// password of user
  late final String password;

  /// convert class to Map
  Map<String, dynamic> toJson() => {
        'username': this.username,
        'password': this.password,
      };

  /// validate param of this method
  int validate(){
    if(this.username.isNotEmpty && this.password.isNotEmpty)return 0;
    return -9999;
  }
}
/// [SignInResponse] this class handler response when sign in
class SignInResponse{
  /// code
  late final int code;
  /// message response when call apis
  late final String message;
  /// constructor
  SignInResponse({this.code=0,this.message=''});

  factory SignInResponse.fromJson(Map<String,dynamic> json){
    return SignInResponse();
  }
}

