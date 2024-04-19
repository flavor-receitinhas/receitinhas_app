import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/my_profile_page.dart';
import 'package:flutter/material.dart';

class ContainerProfileImage extends StatelessWidget {
  const ContainerProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyProfilePage.route);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Global.profile?.image!.isNotEmpty == true
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  Global.profile!.image!,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(
                Icons.person,
                color: Colors.white,
              ),
      ),
    );
  }
}
