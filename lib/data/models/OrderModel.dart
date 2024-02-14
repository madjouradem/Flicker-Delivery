class OrderModel {
  String? orderId;
  String? orderUserId;
  String? orderAddress;
  String? orderType;
  String? orderPriceDelivery;
  String? orderPrice;
  String? orderCoupon;
  String? orderDate;
  String? orderDeliveryType;
  String? orderPayType;
  String? orderStatus;
  String? orderRating;
  String? orderComment;
  String? orderDeliveryId;
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userImage;
  String? userApprove;
  String? userVerfiycode;
  String? userCreateTime;
  String? addressId;
  String? addressUserId;
  String? addressCity;
  String? addressStrees;
  String? addressLat;
  String? addressLng;

  OrderModel(
      {this.orderId,
      this.orderUserId,
      this.orderAddress,
      this.orderType,
      this.orderPriceDelivery,
      this.orderPrice,
      this.orderCoupon,
      this.orderDate,
      this.orderDeliveryType,
      this.orderPayType,
      this.orderStatus,
      this.orderRating,
      this.orderComment,
      this.orderDeliveryId,
      this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userImage,
      this.userApprove,
      this.userVerfiycode,
      this.userCreateTime,
      this.addressId,
      this.addressUserId,
      this.addressCity,
      this.addressStrees,
      this.addressLat,
      this.addressLng});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPriceDelivery = json['order_price_delivery'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderDate = json['order_date'];
    orderDeliveryType = json['order_delivery_type'];
    orderPayType = json['order_pay_type'];
    orderStatus = json['order_status'];
    orderRating = json['order_rating'];
    orderComment = json['order_comment'];
    orderDeliveryId = json['order_delivery_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userImage = json['user_image'];
    userApprove = json['user_approve'];
    userVerfiycode = json['user_verfiycode'];
    userCreateTime = json['user_create_time'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStrees = json['address_strees'];
    addressLat = json['address_lat'];
    addressLng = json['address_lng'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['order_id'] = orderId;
  //   data['order_user_id'] = orderUserId;
  //   data['order_address'] = orderAddress;
  //   data['order_type'] = orderType;
  //   data['order_price_delivery'] = orderPriceDelivery;
  //   data['order_price'] = orderPrice;
  //   data['order_coupon'] = orderCoupon;
  //   data['order_date'] = orderDate;
  //   data['order_delivery_type'] = orderDeliveryType;
  //   data['order_pay_type'] = orderPayType;
  //   data['order_status'] = orderStatus;
  //   data['order_rating'] = orderRating;
  //   data['order_comment'] = orderComment;
  //   data['order_delivery_id'] = orderDeliveryId;
  //   data['user_id'] = userId;
  //   data['user_name'] = userName;
  //   data['user_email'] = userEmail;
  //   data['user_password'] = userPassword;
  //   data['user_image'] = userImage;
  //   data['user_approve'] = userApprove;
  //   data['user_verfiycode'] = userVerfiycode;
  //   data['user_create_time'] = userCreateTime;
  //   data['address_id'] = addressId;
  //   data['address_user_id'] = addressUserId;
  //   data['address_city'] = addressCity;
  //   data['address_strees'] = addressStrees;
  //   data['address_lat'] = addressLat;
  //   data['address_lng'] = addressLng;
  //   return data;
  // }
}
