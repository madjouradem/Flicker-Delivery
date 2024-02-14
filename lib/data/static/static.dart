import 'package:delivery_app/data/models/BNBModel.dart';

import '../../core/constant/AppImage.dart';
import '../../core/constant/AppRoute.dart';

List<BNBModel> bnblist = [
  BNBModel(
    name: 'Home',
    icon: AppImage.home,
    route: AppRoute.home,
    defaultNum: 0,
  ),
  BNBModel(
    name: 'Orders',
    icon: AppImage.orders,
    route: AppRoute.order,
    defaultNum: 1,
  ),
  BNBModel(
    name: 'account',
    icon: AppImage.user,
    route: AppRoute.morePages,
    defaultNum: 2,
  ),
];
