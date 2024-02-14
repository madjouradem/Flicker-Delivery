import 'package:delivery_app/core/bindings/MyBinding.dart';
import 'package:delivery_app/core/middleware/MyMiddlewere.dart';
import 'package:delivery_app/pages/EditProfile/EditProfileView.dart';
import 'package:delivery_app/pages/Home/HomeView.dart';
import 'package:delivery_app/pages/MorePages/MorePagesView.dart';
import 'package:delivery_app/pages/auth/Login/login.dart';
import 'package:delivery_app/pages/auth/forgetpassword/forgetpassword/forgetpassword.dart';
import 'package:delivery_app/pages/auth/forgetpassword/resetpassword/resetpassword.dart';
import 'package:delivery_app/pages/auth/forgetpassword/success_resetpassword/success_resetpassword.dart';
import 'package:delivery_app/pages/auth/forgetpassword/verifycode/verifycode.dart';
import 'package:delivery_app/pages/Maps/mapsWidget.dart';
import 'package:delivery_app/pages/orders/ordersView.dart';
import 'package:get/get.dart';

import 'core/constant/AppRoute.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: '/',
      page: () => const Login(),
      binding: MyBinding(),
      middlewares: [MyMiddlewere()]),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  // GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  // GetPage(
  //     name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.order, page: () => const OrderView()),
  // GetPage(name: AppRoute.orderLocation, page: () => const OrderLocation()),
  GetPage(name: AppRoute.maps, page: () => const MapsView()),
  //more pages
  GetPage(name: AppRoute.morePages, page: () => const MorePagesView()),
  //editprofile
  GetPage(name: AppRoute.editprofile, page: () => const EditProfileView()),
  // GetPage(name: AppRoute.categories, page: () => const Categories()),
  // GetPage(name: AppRoute.categoryItems, page: () => const CategoryItems()),
  // GetPage(name: AppRoute.moreItems, page: () => const MoreItems()),
];
