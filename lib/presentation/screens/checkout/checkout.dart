part of 'checkout_imports.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

enum PaymentMethods {
  cod,
  paypal,
  razorpay,
  khalti,
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var myPayment = PaymentMethods.cod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: "Checkout".text.make(),
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (state is OrderLoadedState) {
            return SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  "Customer Information".text.bold.xl2.make(),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(fullName: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Full Name",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(email: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Email",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(phoneNumber: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Phone Number",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  "Delivery Information".text.bold.xl2.make(),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(address: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Address",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(city: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "City",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(country: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Country",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  VxTextField(
                    onChanged: (value) {
                      context
                          .read<OrderBloc>()
                          .add(UpdateOrdersEvent(zipCode: value));
                    },
                    contentPaddingLeft: 10,
                    fillColor: Colors.orange.withOpacity(0.1),
                    hint: "Zip Code",
                    cursorColor: Colors.orange,
                    borderColor: Colors.orange,
                    borderType: VxTextFieldBorderType.underLine,
                  ),
                  20.heightBox,
                  "Payment Methods".text.bold.xl2.make(),
                  20.heightBox,
                  RadioListTile(
                    title: 'Cash on Delivery'.text.make(),
                    value: PaymentMethods.cod,
                    groupValue: myPayment,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        myPayment = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: 'Paypal'.text.make(),
                    value: PaymentMethods.paypal,
                    groupValue: myPayment,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        myPayment = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: 'Razor Pay'.text.make(),
                    value: PaymentMethods.razorpay,
                    groupValue: myPayment,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        myPayment = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: 'Khalti'.text.make(),
                    value: PaymentMethods.khalti,
                    groupValue: myPayment,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        myPayment = value!;
                      });
                    },
                  ),
                  30.heightBox,
                  GradientButton(
                          onTap: () {
                            context.read<OrderBloc>().add(
                                  ConfirmOrdersEvent(
                                    orders: state.orders,
                                  ),
                                );
                          },
                          title: "Order")
                      .pOnly(bottom: 100)
                ],
              ).pSymmetric(h: 15),
            );
          } else {
            return "Something went wrong".text.make();
          }
        },
      ),
    );
  }
}
