import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/order/order_bloc.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    final user = context.read<AppBloc>().state.user;
    context.read<OrderBloc>().add(OrderFetch(userId: user.id));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: Image.network(
                    user.photo ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrIMwQF5tiqO-E-rYuz7TT_tZ4ITeDzK3a-g&usqp=CAU',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  )),
              const SizedBox(height: 4),
              TypographyCustom.medium(
                text: user.email ?? '',
                fontSize: 20,
              ),
              const SizedBox(height: 4),
              if (state.orderItems.isNotEmpty)
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TypographyCustom.regular(
                        text: 'Orders:', fontSize: 20)),
              const SizedBox(height: 8),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 78.0 + 30),
                    child: ListView.builder(
                      itemCount: state.orderItems.length,
                      itemBuilder: (context, index) {
                        final item = state.orderItems[index];
                        return OrderListItem(
                          item: item,
                          onCancellPress: () {
                            context
                                .read<OrderBloc>()
                                .add(CancellOrder(id: item.id));
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
