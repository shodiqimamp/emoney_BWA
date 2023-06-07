import 'package:emoney_app/blocs/user/user_bloc.dart';
import 'package:emoney_app/models/user_model.dart';
import 'package:emoney_app/shared/theme.dart';
import 'package:emoney_app/ui/widgets/button.dart';
import 'package:emoney_app/ui/widgets/form.dart';
import 'package:emoney_app/ui/widgets/transfer_recent_user_item.dart';
import 'package:emoney_app/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

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
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty
              ? buildRecentUser()
              : buildResultUser(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Column(
                children: state.users.map((user) {
                  return TransferRecentUserItem(user: user);
                }).toList(),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
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
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: state.users.map((user) {
                  return TransferResultUserItem(user: user);
                  // return GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       selectedUser = user;
                  //     });
                  //   },
                  //   child: TransferResultUserItem(
                  //       user: user, isSelected: user.id == selectedUser?.id),
                  // );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    ),
  );
}
