// import 'package:shared_preferences/shared_preferences.dart';

// import '../../Constants/Person/person.dart';
// import '../../Constants/shared_preferences_constants.dart';

// deleteUserData() async {
//   Person _person = Person();

//   await SharedPreferences.getInstance().then((value) {
//     // value.remove(userIdSPKey);
//     // value.remove(firstNameSPKey);
//     // value.remove(lastNameSPKey);
//     final success = value.remove(IdSPKey);
//     print(success.then((value) => value));
//     // value.remove(cnicSPKey);
//     // value.remove(roleNameSPKey);
//     // value.remove(roleIdSPKey);
//   });
// }

// class MySharedPreferences {
//   static deleteUserData() async {
//     Person _person = Person();

//     await SharedPreferences.getInstance().then((value) {
//       // value.remove(userIdSPKey);
//       // value.remove(firstNameSPKey);
//       // value.remove(lastNameSPKey);
//       final success = value.remove(IdSPKey);

//       print(success.then((value) => value));
//       value.remove(IdSPKey);
//       value.remove(cprNoSPKey);
//       value.remove(fullNameSPKey);
//       value.remove(mobileNoSPKEY);
//     });
//   }

//   static setUserData({required Person person}) async {
//     await SharedPreferences.getInstance().then((value) {
//       value.setInt(IdSPKey, person.data!.id ?? 0);
//       value.setString(cprNoSPKey, person.data!.cprNumber ?? '');
//       value.setString(fullNameSPKey, person.data!.fullName ?? '');
//       value.setString(mobileNoSPKEY, person.data!.mobileNumber ?? '');
//     });
//   }

//   static Future<Person> getUserData() async {
//     var _person = Person();
//     await SharedPreferences.getInstance().then((value) {
//       value.getInt(IdSPKey) ?? value.setInt(IdSPKey, 0);
//       value.getInt(cprNoSPKey) ?? value.setString(cprNoSPKey, '');
//       value.getString(fullNameSPKey) ?? value.setString(fullNameSPKey, '');
//       value.getString(mobileNoSPKEY) ?? value.setString(mobileNoSPKEY, '');

//       _person = Person(
//         data: Data(
//           id: value.getInt(IdSPKey),
//           cprNumber: value.getString(cprNoSPKey),
//           fullName: value.getString(fullNameSPKey),
//           mobileNumber: value.getString(mobileNoSPKEY),
          
          
//           confirmPassword: '',
//           createdAt: '',
//           updatedAt: '',
          
          
//         ),
        
//       );
//     });
//     return _person;
//   }
// }
