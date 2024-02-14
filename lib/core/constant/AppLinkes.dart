// ignore_for_file: file_names

class AppLink {
  static const String serverLink = 'http://10.0.2.2/ecommerce/';
  static const String upload = '${serverLink}upload/';
  static const String api = '${serverLink}api/Delivery/';

//auth
  static const String login = '${api}Auth/LogIn.php';
  static const String logins = '${serverLink}Auth/LogIn.php';
  static const String signup = '${api}Auth/SignUp.php';
  static const String verifycodessignup = '${api}Auth/VerfiyCode.php';
  static const String checkEmail = '${api}Auth/ForgetPassword/CheckEmail.php';
  static const String resetPassword =
      '${api}Auth/ForgetPassword/ResetPassword.php';
  static const String verifycodeforgetpassword =
      '${api}Auth/ForgetPassword/VerfiyCode.php';
  //viewOrders
  static const String viewOrders = '${api}orders/ViewOrders.php';
  //viewDeliverOrders
  static const String viewDeliverOrders = '${api}orders/viewDeliverOrders.php';
  //
  static const String deliveredOrders = '${api}orders/DeliveredOrders.php';
  static const String confirmationOrders =
      '${api}orders/ConfirmationOrders.php';
  //editProfile
  static const String changeUsername = '${api}editProfile/changeUsername.php';
  static const String changePassword = '${api}editProfile/changePassword.php';
  static const String changeImage = '${api}editProfile/changeImage.php';
}
