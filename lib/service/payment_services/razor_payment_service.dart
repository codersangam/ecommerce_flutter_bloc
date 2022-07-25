import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter_bloc/blocs/order/bloc/order_bloc.dart';
import 'package:ecommerce_flutter_bloc/presentation/router/router_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPaymentService {
  late Razorpay _razorpay;

  late BuildContext _buildContext;
  late dynamic _state;

  initPaymentGateway(BuildContext buildContext, state) {
    _buildContext = buildContext;
    _state = state;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS: ${response.paymentId!}");
    _buildContext.read<OrderBloc>().add(ConfirmOrdersEvent(
          orders: _state.orders,
        ));
    AutoRouter.of(_buildContext).push(const OrdersScreenRoute());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(
      "ERROR: ${response.code} - ${response.message!}",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response.walletName);
  }

  getPayment(BuildContext context, price) {
    var options = {
      'key': 'rzp_test_Jjb98zIx2rauLk',
      'amount': double.tryParse(price)! * 100,
      'name': 'Test Corp',
      'description': 'Payment for our products',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
