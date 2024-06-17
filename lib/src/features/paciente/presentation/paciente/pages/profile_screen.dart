import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/widgets/profile_icon.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/widgets/profile_menu_items.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/widgets/user_info.dart';
import 'package:app_plataforma/src/features/pdf/presentation/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';

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

    return Column(
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
          Expanded(
            child: ListView.builder(
                itemCount: profileMenuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = profileMenuItems[index];
                  return _ProfileListTitle(menuItem: menuItem);
                }
            ),
          ),
          IconButtonCustom(
            onPressed: () {  },
            text: 'Cerrar sesión',
            color: const Color(0xFFD62828),
            icon: Icons.logout,
          )
        ]
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

    final color = Theme.of(context).colorScheme.primary;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      horizontalTitleGap: 10,
      leading: Icon(menuItem.icono, color: color,),
      trailing: Icon( Icons.arrow_forward_ios_outlined, color: color,),
      title: AppTextStyles.autoBodyStyle(
          text: menuItem.titulo,
          color: color,
          maxLines: 1,
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