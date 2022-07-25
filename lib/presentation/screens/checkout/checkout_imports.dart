import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter_bloc/blocs/order/bloc/order_bloc.dart';
import 'package:ecommerce_flutter_bloc/blocs/payment/bloc/payment_bloc.dart';
import 'package:ecommerce_flutter_bloc/data/models/payment_methods_model.dart';
import 'package:ecommerce_flutter_bloc/presentation/router/router_imports.gr.dart';
import 'package:ecommerce_flutter_bloc/presentation/widgets/gradient_button.dart';
import 'package:ecommerce_flutter_bloc/service/payment_services/razor_payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

part 'checkout.dart';
part 'checkout_data.dart';
