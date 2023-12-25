import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/Person/person.dart';
import '../../Constants/shared_preferences_constants.dart';

// class MySharedPreferences {
//   static setUserData({required Person person}) async {
//     await SharedPreferences.getInstance().then((value) {
//       value.setInt(userIdSPKey, person.userId ?? 0);
//       value.setInt(companyIdSPKey, person.company_id ?? 0);
//       value.setString(nameSPKey, person.name ?? '');
//       value.setString(firstNameSPKey, person.first_name ?? '');
//       value.setString(lastNameSPKey, person.last_name ?? '');
//       value.setString(mobileNoSPKEY, person.mobile_no ?? '');

//       value.setInt(userRoleIdSPKey, person.user_role_id ?? 0);
//       value.setString(emailSPKEY, person.email ?? '');
//       value.setString(typeSPKEY, person.type ?? '');
//       value.setString(bearerTokenSPKEY, person.bearerToken ?? '');
//     });
//   }

//   static Future<Person> getUserData() async {
//     Person person = Person();
//     await SharedPreferences.getInstance().then((value) {
//       value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
//       value.getInt(companyIdSPKey) ?? value.setInt(companyIdSPKey, 0);
//       value.getString(nameSPKey) ?? value.setString(nameSPKey, '');
//       value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
//       value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');

//       value.getString(mobileNoSPKEY) ?? value.setString(mobileNoSPKEY, '');
//       value.getInt(userRoleIdSPKey) ?? value.setInt(userRoleIdSPKey, 0);
//       value.getString(emailSPKEY) ?? value.setString(emailSPKEY, '');
//       value.getString(typeSPKEY) ?? value.setString(typeSPKEY, '');
//       value.getString(bearerTokenSPKEY) ??
//           value.setString(bearerTokenSPKEY, '');

//       person = Person(
//         userId: value.getInt(userIdSPKey),
//         company_id: value.getInt(companyIdSPKey),
//         name: value.getString(nameSPKey),
//         first_name: value.getString(firstNameSPKey),
//         last_name: value.getString(lastNameSPKey),
//         mobile_no: value.getString(mobileNoSPKEY),
//         user_role_id: value.getInt(userRoleIdSPKey),
//         email: value.getString(emailSPKEY),
//         type: value.getString(typeSPKEY),
//         bearerToken: value.getString(bearerTokenSPKEY),
//       );
//     });

//     return person;
//   }

//   static deleteUserData() async {
//     await SharedPreferences.getInstance().then((value) {
//       value.remove(userIdSPKey);
//       value.remove(companyIdSPKey);
//       value.remove(nameSPKey);
//       value.remove(firstNameSPKey);
//       value.remove(lastNameSPKey);
//       value.remove(mobileNoSPKEY);
//       value.remove(userRoleIdSPKey);
//       value.remove(emailSPKEY);
//       value.remove(typeSPKEY);
//       value.remove(bearerTokenSPKEY);
//     });
//   }
// }

deleteUserData() async {
  Person _person = Person();

  await SharedPreferences.getInstance().then((value) {
    // value.remove(userIdSPKey);
    // value.remove(firstNameSPKey);
    // value.remove(lastNameSPKey);
    final success = value.remove(bearerTokenSPKEY);
    print(success.then((value) => value));
    // value.remove(cnicSPKey);
    // value.remove(roleNameSPKey);
    // value.remove(roleIdSPKey);
  });
}

class MySharedPreferences {
  static deleteUserData() async {
    Person _person = Person();

    await SharedPreferences.getInstance().then((value) {
      // value.remove(userIdSPKey);
      // value.remove(firstNameSPKey);
      // value.remove(lastNameSPKey);
      final success = value.remove(bearerTokenSPKEY);

      print(success.then((value) => value));
      value.remove(userIdSPKey);
      value.remove(companyIdSPKey);
      value.remove(nameSPKey);
      value.remove(firstNameSPKey);
      value.remove(lastNameSPKey);
      value.remove(mobileNoSPKEY);
      value.remove(userRoleIdSPKey);
      value.remove(emailSPKEY);
      value.remove(typeSPKEY);
      value.remove(bearerTokenSPKEY);
    });
  }

  static setUserData({required Person person}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(userIdSPKey, person.data!.id ?? 0);
      value.setInt(companyIdSPKey, person.data!.companyId ?? 0);
      value.setString(nameSPKey, person.data!.name ?? '');
      value.setString(firstNameSPKey, person.data!.firstName ?? '');
      value.setString(lastNameSPKey, person.data!.lastName ?? '');
      value.setString(mobileNoSPKEY, person.data!.mobileNo ?? '');

      value.setInt(userRoleIdSPKey, person.data!.userRoleId ?? 0);
      value.setString(emailSPKEY, person.data!.email ?? '');
      value.setString(typeSPKEY, person.data!.type ?? '');
      value.setString(bearerTokenSPKEY, person.Bearer ?? '');
    });
  }

  static Future<Person> getUserData() async {
    var _person = Person();
    await SharedPreferences.getInstance().then((value) {
      value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
      value.getInt(companyIdSPKey) ?? value.setInt(companyIdSPKey, 0);
      value.getString(nameSPKey) ?? value.setString(nameSPKey, '');
      value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
      value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');

      value.getString(mobileNoSPKEY) ?? value.setString(mobileNoSPKEY, '');
      value.getInt(userRoleIdSPKey) ?? value.setInt(userRoleIdSPKey, 0);
      value.getString(emailSPKEY) ?? value.setString(emailSPKEY, '');
      value.getString(typeSPKEY) ?? value.setString(typeSPKEY, '');
      value.getString(bearerTokenSPKEY) ??
          value.setString(bearerTokenSPKEY, '');

      _person = Person(
        data: Data(
          id: value.getInt(userIdSPKey),
          companyId: value.getInt(companyIdSPKey),
          name: value.getString(nameSPKey),
          firstName: value.getString(firstNameSPKey),
          lastName: value.getString(lastNameSPKey),
          mobileNo: value.getString(mobileNoSPKEY),
          userRoleId: value.getInt(userRoleIdSPKey),
          email: value.getString(emailSPKEY),
          type: value.getString(typeSPKEY),
        ),
        Bearer: value.getString(bearerTokenSPKEY),
      );
    });
    return _person;
  }
}
