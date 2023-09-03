import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/constants/app_colors.dart';
import 'package:nubank_clone/constants/mocked_values.dart';
import 'package:nubank_clone/constants/nu_icons.dart';
import 'package:nubank_clone/mocks/historic_mock.dart';
import 'package:nubank_clone/pages/account/widgets/account_menu.dart';
import 'package:nubank_clone/pages/charge/charge_screen.dart';
import 'package:nubank_clone/pages/deposit/deposit_screen.dart';
import 'package:nubank_clone/pages/loan/loan_screen.dart';
import 'package:nubank_clone/pages/payment/payment_screen.dart';
import 'package:nubank_clone/pages/transfer/transfer_screen.dart';
import 'package:nubank_clone/utils/extensions/router_context_extension.dart';
import 'package:nubank_clone/widgets/filled_container.dart';
import 'package:nubank_clone/widgets/label_button.dart';
import 'package:nubank_clone/widgets/search_input.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            NuIcons.nuds_ic_chevron_left,
            color: AppColors.secondaryText,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              MdiIcons.helpCircleOutline,
              color: AppColors.secondaryText,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Saldo disponível',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'R\$ ${MockedValues.balance}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 50),
                  const AccountMenu(
                    'Movimentações do mês',
                    null,
                    BootstrapIcons.arrow_down_up,
                  ),
                  const SizedBox(height: 20),
                  AccountMenu(
                    'Dinheiro guardado',
                    Text(
                      'R\$ ${MockedValues.saved}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    BootstrapIcons.piggy_bank,
                  ),
                  const SizedBox(height: 30),
                  AccountMenu(
                    'Rendimento total da conta',
                    RichText(
                      text: TextSpan(
                        text: '+R\$ ${MockedValues.income}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.limit,
                                  fontWeight: FontWeight.w500,
                                ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' este mês',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MdiIcons.signal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelButton(
                      'Depositar',
                      BootstrapIcons.cash,
                      onPressed: () => context.showBottomSheet(
                        const DepositScreen(),
                      ),
                    ),
                    LabelButton(
                      'Pagar',
                      MdiIcons.barcode,
                      onPressed: () => context.showBottomSheet(
                        const PaymentScreen(),
                      ),
                    ),
                    LabelButton(
                      'Transferir',
                      MdiIcons.cubeSend,
                      onPressed: () => context.showBottomSheet(
                        TransferScreen(),
                      ),
                    ),
                    LabelButton(
                      'Débito automático',
                      BootstrapIcons.bank,
                      onPressed: () => context.push(
                        const LoanScreen(),
                      ),
                    ),
                    LabelButton(
                      'emprestimo',
                      MdiIcons.messageAlertOutline,
                      onPressed: () => context.showBottomSheet(ChargeScreen()),
                    ),
                    LabelButton(
                      'investir',
                      MdiIcons.messageAlertOutline,
                      onPressed: () => context.showBottomSheet(ChargeScreen()),
                    ),
                    LabelButton(
                      'Pedir Extrato',
                      MdiIcons.messageAlertOutline,
                      onPressed: () => context.showBottomSheet(ChargeScreen()),
                    ),
                    LabelButton(
                      'Cobrar',
                      MdiIcons.messageAlertOutline,
                      onPressed: () => context.showBottomSheet(ChargeScreen()),
                    ),
                    LabelButton(
                      'Seu salário',
                      MdiIcons.messageAlertOutline,
                      onPressed: () => context.showBottomSheet(ChargeScreen()),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FilledContainer(
              icon: Icons.car_crash_outlined,
              text: 'Assistente de pagamentos',
            ),
            const SizedBox(height: 10),
            const FilledContainer(
              icon: Icons.car_crash_outlined,
              text: r'Até R$ 50.000,00 disponíveis para empréstimo',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Histórico',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SearchInput(),
            const SizedBox(height: 30),
            ...historicMock
          ],
        ),
      ),
    );
  }
}
