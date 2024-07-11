import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/core/theme/widgets/toggle_switch.dart';
import 'package:app_plataforma/src/features/paciente/presentation/profile/pages/profile_menu_items.dart';
import 'package:app_plataforma/src/features/paciente/presentation/profile/widgets/profile_icon.dart';
import 'package:app_plataforma/src/features/paciente/presentation/profile/widgets/user_info.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
          children: [
            const Row(
                children: [
                  SizedBox(width: 5,),
                  ProfileIcon(),
                  UserInfo(
                      usuario: 'Daniel Martínez',
                      correo: 'correo@gmail.com'
                  )
                ]
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.025),
            Column(
              children: profileMenuItems.map((item) =>
                  _ProfileListTitle(menuItem: item)).toList(),
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
            BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    final isDarkMode = state.when(
                      success: (isDarkMode) => isDarkMode,
                    );
                    return ToggleSwitch(
                      value: isDarkMode,
                      onChanged: (value) {
                        sl<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
            ),
            const Spacer(),
            IconButtonCustom(
              onPressed: () {  },
              text: 'Cerrar sesión',
              color: const Color(0xFFD62828),
              icon: Icons.logout,
            )
          ]
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}


class _ProfileListTitle extends StatelessWidget {

  final MenuItem menuItem;

  const _ProfileListTitle({required this.menuItem});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme.onBackground;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      horizontalTitleGap: 10,
      leading: Icon(menuItem.icono, color: color,),
      trailing: Icon( Icons.arrow_forward_ios_outlined, color: color,),
      title: AppTextStyles.autoBodyStyle(
          text: menuItem.titulo,
          color: color,
          height: height,
          percent: 0.025
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => menuItem.screen),
        );
      },
    );

  }

}
