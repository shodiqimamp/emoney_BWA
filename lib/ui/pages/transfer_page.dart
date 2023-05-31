import 'package:emoney_app/shared/theme.dart';
import 'package:emoney_app/ui/widgets/button.dart';
import 'package:emoney_app/ui/widgets/form.dart';
import 'package:emoney_app/ui/widgets/transfer_recent_user_item.dart';
import 'package:emoney_app/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // BuildRecentUser(),
          buildResultUser(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

Widget buildRecentUser() {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friend1.png',
          name: 'Yonna Jie',
          userName: 'yonna',
          isVerified: true,
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friend2.png',
          name: 'John Hi',
          userName: 'jhi',
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friend3.png',
          name: 'Masayoshi',
          userName: 'form',
          isVerified: false,
        ),
      ],
    ),
  );
}

Widget buildResultUser() {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            TransferResultUserItem(
              imageUrl: 'assets/img_friend1.png',
              name: 'Yonna Jie',
              userName: 'yonna',
              isVerified: true,
            ),
            TransferResultUserItem(
              imageUrl: 'assets/img_friend4.png',
              name: 'Yonne Ka',
              userName: 'yoenyu',
              isVerified: false,
              isSelected: true,
            ),
          ],
        )
      ],
    ),
  );
}
