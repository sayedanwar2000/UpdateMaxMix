import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:masmix/stripe_payment/stripe_keys.dart';

abstract class PaymentManager {
// 100
  //This Function to Payment
  // And
  // display Sheet to Payment
  static Future<void> makePayment(
      double amount, String currency, String userId) async {
    try {
      print(userId);
      Stripe.publishableKey = ApiKeys.publishableKey;
      String clientSecret =
          await _getClientSecret((amount * 100).toInt().toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  //This Function Initialize Payment Sheet
  static Future<void> _initializePaymentSheet(
      String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "MasMix",
        // customerId: clientId,
      ),
    );
  }

  //This Function To Get Client Secret Key
  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        "amount": amount,
        "currency": currency,
      },
    );
    return response.data["client_secret"];
  }

/*  static Future<String> _CreateClient(String name) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/customers',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        "name": name,
        // 'customer':name
      },
    );
    return response.data["id"];
  }*/
}
