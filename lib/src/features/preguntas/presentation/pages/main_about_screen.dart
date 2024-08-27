import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/container_option_widget.dart';
import 'package:flutter/material.dart';

class MainAboutScreen extends StatelessWidget {

  const MainAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: const AppBarCustom(
            title: 'Acerca De',
            center: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child:
                          ContainerOptionWidget(
                            icon: Icons.menu_book_rounded,
                            title: 'Instrucciones',
                            onTap: () {

                            },
                          )
                      )
                      ,
                      Expanded(
                          child: ContainerOptionWidget(
                            icon: Icons.question_answer_rounded,
                            title: 'Preguntas',
                            onTap: () {

                            },
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                          ContainerOptionWidget(
                            icon: Icons.info_rounded,
                            title: 'Acerca De',
                            onTap: (){

                            },
                          )
                      ),
                      Expanded(
                          child:
                          ContainerOptionWidget(
                            icon: Icons.contact_support_rounded,
                            title: 'Soporte',
                            onTap: (){

                            },
                          )
                      ),
                    ],
                  )
                ]
              ),
            ),
          ),
        )
    );
  }

}