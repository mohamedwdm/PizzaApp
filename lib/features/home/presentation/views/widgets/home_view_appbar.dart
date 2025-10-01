
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
    
      title: Row(
        children: [
          Image.asset("assets/images/8.png", scale: 14),
          const SizedBox(width: 5),
          const Text(
            'PIZZA',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).logOut();
            Navigator.pop(context);
          },
          icon: const Icon(FontAwesomeIcons.arrowRightFromBracket, size: 22),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.cartPlus, size: 22),
        ),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
