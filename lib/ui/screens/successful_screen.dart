import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:watumira/ui/widgets/detail_item.dart';

class SuccessfullScreen extends StatelessWidget {
  static final String route = 'successful_screen';
  const SuccessfullScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order successful'),
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutProcessSuccessfull) {
            return Container(
              child: ListView(
                padding: EdgeInsets.all(12),
                children: [
                  SizedBox(height: 32),
                  Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 48,
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Order successfully placed.',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'Thank you! Your order will be processed once payment is done.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text.rich(
                      TextSpan(
                        text: 'NB: ',
                        children: [
                          TextSpan(
                            text: 'Your order will expire in 48h if not paid!',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Bank Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          Text(
                            'All bank transfers should be immediate payments. Please send your proof of payment on +27658729513 via WhatsApp.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'WatumiraHere Pty Ltd',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),
                          DetailItem(title: 'Bank: ', value: 'FNB'),
                          DetailItem(title: 'Account Number: ', value: '62862030683'),
                          DetailItem(title: 'Payment Reference: ', value: state.order.refCode),
                          DetailItem(title: 'Branch Code: ', value: '259605'),
                          DetailItem(title: 'IBAN: ', value: 'The Glen'),
                          DetailItem(title: 'BIC: ', value: 'Business Current Account'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Other Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          DetailItem(title: 'Order Ref Code: ', value: state.order.refCode),
                          DetailItem(title: 'Collection Point: ', value: state.order.collectionPoint.name),
                          DetailItem(title: 'Collector Name: ', value: state.order.collector.name),
                          DetailItem(title: 'Collector Phone Number: ', value: state.order.collector.phoneNumber),
                          SizedBox(height: 16),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '${state.order.collector.name} must bring a '),
                                TextSpan(text: 'national identification card ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'to collect the goods'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go to home'),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
