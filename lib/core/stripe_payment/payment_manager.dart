import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shopy/core/stripe_payment/stripe_keys.dart';

abstract class PaymentManager {
  static Future<bool> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);

      await initializePaymentSheet(clientSecret);

      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();

    var response = await dio.post('https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        });

    return response.data['client_secret'];
  }

  static Future<void> initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: 'Hema',
    ));
  }

  // static Future<bool> successfullyPaid(String clientSecret) async {
  //   var paymentIntent =
  //       await Stripe.instance.retrievePaymentIntent(clientSecret);
  //   if (paymentIntent.status == 'succeeded') {
  //     print('yes');
  //     return true;
  //   } else {
  //     print('no');
  //     return false;
  //   }
  // }
}
