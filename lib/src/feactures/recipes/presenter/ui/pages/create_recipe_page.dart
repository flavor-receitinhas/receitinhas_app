import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/info_create_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/introduce_create_page.dart';
import 'package:flutter/material.dart';

class CreateRecipePage extends StatefulWidget {
  static const route = '/create-recipe';
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final CreateRecipeController ct = di();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: ct.onChangedPage,
      controller: ct.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        IntroduceCreatePage(ct: ct),
         InfoCreatePage(ct: ct,),
      ],
    );
  }
}

// return Scaffold(
//   body: SafeArea(
//     child: Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key: formKey,
//       child: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         children: [
//           const SizedBox(height: 10),
//           CreateBackAndSafeButton(ct: ct),
//           const SizedBox(height: 10),
//           
//           const SizedBox(height: 20),
//           const CreateAdditionalInfo(),
//           const SizedBox(height: 20),
//           CreateDetailsRecipe(ct: ct),
//           const SizedBox(height: 20),
//         ],
//       ),
//     ),
//   ),
