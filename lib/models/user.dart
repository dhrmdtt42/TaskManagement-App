class User{
   String userName;
   String userId;

   User.data({this.userName, this.userId});
   User();
  factory User.fromJson(Map<dynamic, dynamic> jsonData){
     return User.data(
        userName: jsonData['userName'],
        userId: jsonData['userId']
     );
   }

   Map<dynamic, dynamic> toJson() {
     final Map<String, dynamic> userData = new Map<String, dynamic>();
     userData['userName'] = this.userName;
     userData['userId'] = this.userId;
     return userData;
   }
}