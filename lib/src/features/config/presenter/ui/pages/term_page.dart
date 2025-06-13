import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/config/presenter/ui/atomic/back_buttom_floating.dart';
import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  static const route = '/termos';
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            BackButtomFloating(label: 'Termos e condições'),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: CookieText(
                  textAlign: TextAlign.start,
                  text: '''
Termos e Condições Temporários

Estes Termos e Condições temporários ("Termos") regem o uso do aplicativo. Ao utilizar o Aplicativo, você concorda com estes Termos.

1. Uso do Aplicativo

Ao aceitar estes Termos, você recebe uma licença limitada, não exclusiva e intransferível para usar o Aplicativo de acordo com seu propósito previsto.

2. Registro e Conta

Ao se registrar para uma conta no Aplicativo, você concorda em fornecer informações precisas e completas. Você é responsável por manter a confidencialidade de suas credenciais de conta.

3. Conteúdo do Usuário

Ao enviar conteúdo para o Aplicativo, você concede a BovinoApps uma licença mundial, não exclusiva, royalty-free para usar, reproduzir, modificar, distribuir e exibir esse conteúdo.

4. Restrições de Uso

Você concorda em não:

Violar leis aplicáveis.
Fornecer informações falsas ou enganosas.
Interferir no funcionamento adequado do Aplicativo.
Tentar acessar áreas restritas sem autorização.

5. Propriedade Intelectual

O Aplicativo e todo o seu conteúdo são propriedade de BovinoApps e estão protegidos por leis de propriedade intelectual.

6. Limitação de Responsabilidade

O uso do Aplicativo é por sua conta e risco. BovinoApps não se responsabiliza por danos diretos, indiretos, incidentais, especiais ou consequenciais resultantes do uso ou incapacidade de usar o Aplicativo.

7. Modificações nos Termos

Reservamo-nos o direito de modificar estes Termos a qualquer momento. As alterações entrarão em vigor imediatamente após a publicação. Recomendamos que você revise periodicamente os Termos.

8. Encerramento do Acesso

Podemos encerrar ou suspender seu acesso ao Aplicativo a qualquer momento, por qualquer motivo, sem aviso prévio.

9. Lei Aplicável

Estes Termos são regidos e interpretados de acordo com as leis do Brasil. Qualquer litígio decorrente destes Termos será resolvido nos tribunais.

10. Contato

Para entrar em contato conosco sobre estes Termos, utilize as informações de contato fornecidas no Aplicativo.

Última atualização: 08/01/2024
            ''',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
