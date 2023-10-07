// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// User Model To Save Data

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.mob,
    required this.mob1,
    required this.accountType,
    required this.accountTypeName,
    required this.membershipType,
    required this.defaultLanguage,
    required this.referralCode,
    required this.userUname,
    required this.userPassword,
    required this.invoiceAddress,
    required this.invoiceCountryCode,
    required this.invoiceStateCode,
    required this.invoiceCityCode,
    required this.invoiceZipPostalCode,
    required this.emailSent,
    required this.phoneCountryCode,
    this.phoneCountryCode2,
    required this.currency,
    required this.currencyName,
    required this.removeShoe,
    required this.noImages,
    required this.getNoti,
    required this.availableWallet,
    required this.forgetPassword,
    required this.tempPassword,
    required this.companyCode,
    required this.voucherCode,
    required this.registerDate,
    required this.userIp,
    required this.userCountryCode,
    required this.myReferralCode,
  });

  int? id;
  String?fName;
  String? lName;
  String? email;
  String? mob;
  String? mob1;
  int? accountType;
  String? accountTypeName;
  int? membershipType;
  int? defaultLanguage;
  String? referralCode;
  String? userUname;
  String? userPassword;
  String? invoiceAddress;
  int? invoiceCountryCode;
  String? invoiceStateCode;
  int? invoiceCityCode;
  String? invoiceZipPostalCode;
  int? emailSent;
  String? phoneCountryCode;
  dynamic phoneCountryCode2;
  String? currency;
  String? currencyName;
  int? removeShoe;
  int? noImages;
  int? getNoti;
  int? availableWallet;
  double? forgetPassword;
  double? tempPassword;
  String? companyCode;
  String? voucherCode;
  DateTime? registerDate;
  String? userIp;
  String? userCountryCode;
  String? myReferralCode;

  factory UserModel.fromJson(List<dynamic> json) => UserModel(
    id: json[0]["id"].toInt(),
    fName: json[0]["f_name"],
    lName: json[0]["l_name"],
    email: json[0]["email"],
    mob: json[0]["mob"],
    mob1: json[0]["mob1"],
    accountType: json[0]["account_type"].toInt(),
    accountTypeName: json[0]["account_type_name"],
    membershipType: json[0]["membership_type"].toInt(),
    defaultLanguage: json[0]["default_language"].toInt(),
    referralCode: json[0]["referral_code"],
    userUname: json[0]["user_uname"],
    userPassword: json[0]["user_password"],
    invoiceAddress: json[0]["invoice_address"],
    invoiceCountryCode: json[0]["invoice_country_code"].toInt(),
    invoiceStateCode: json[0]["invoice_state_code"],
    invoiceCityCode: json[0]["invoice_city_code"].toInt(),
    invoiceZipPostalCode: json[0]["invoice_zip_postal_code"],
    emailSent: json[0]["email_sent"].toInt(),
    phoneCountryCode: json[0]["phone_country_code"],
    phoneCountryCode2: json[0]["phone_country_code2"],
    currency: json[0]["currency"],
    currencyName: json[0]["currency_name"],
    removeShoe: json[0]["remove_shoe"].toInt(),
    noImages: json[0]["no_images"].toInt(),
    getNoti: json[0]["get_noti"].toInt(),
    availableWallet: json[0]["available_wallet"].toInt(),
    forgetPassword: json[0]["forget_password"],
    tempPassword: json[0]["temp_password"],
    companyCode: json[0]["company_code"],
    voucherCode: json[0]["voucher_code"],
    registerDate: json[0]["register_date"]== null?DateTime(2000):DateTime.parse(json[0]["register_date"]),
    userIp: json[0]["user_ip"],
    userCountryCode: json[0]["user_country_code"],
    myReferralCode: json[0]["my_referral_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "email": email,
    "mob": mob,
    "mob1": mob1,
    "account_type": accountType,
    "account_type_name": accountTypeName,
    "membership_type": membershipType,
    "default_language": defaultLanguage,
    "referral_code": referralCode,
    "user_uname": userUname,
    "user_password": userPassword,
    "invoice_address": invoiceAddress,
    "invoice_country_code": invoiceCountryCode,
    "invoice_state_code": invoiceStateCode,
    "invoice_city_code": invoiceCityCode,
    "invoice_zip_postal_code": invoiceZipPostalCode,
    "email_sent": emailSent,
    "phone_country_code": phoneCountryCode,
    "phone_country_code2": phoneCountryCode2,
    "currency": currency,
    "currency_name": currencyName,
    "remove_shoe": removeShoe,
    "no_images": noImages,
    "get_noti": getNoti,
    "available_wallet": availableWallet,
    "forget_password": forgetPassword,
    "temp_password": tempPassword,
    "company_code": companyCode,
    "voucher_code": voucherCode,
    "register_date": registerDate!.toIso8601String(),
    "user_ip": userIp,
    "user_country_code": userCountryCode,
    "my_referral_code": myReferralCode,
  };
}
