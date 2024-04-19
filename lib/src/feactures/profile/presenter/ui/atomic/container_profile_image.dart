import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/my_profile_page.dart';
import 'package:flutter/material.dart';

class ContainerProfileImage extends StatelessWidget {
  const ContainerProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            MyProfilePage.route,
            arguments: Global.profile,
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: Global.profile!.image != null &&
                      Global.profile!.image!.isNotEmpty
                  ? NetworkImage(
                      Global.profile!.image!,
                    )
                  : const AssetImage('assets/images/avatar.png')
                      as ImageProvider<Object>,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
