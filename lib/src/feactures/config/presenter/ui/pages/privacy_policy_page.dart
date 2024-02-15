import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_left_button.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            SizedBox(height: 10),
            Row(
              children: [
                CookieLeftButton(title: 'Políticas de Privacidade'),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: CookieText(
                textAlign: TextAlign.start,
                text: '''
Política de Privacidade Temporária
            
Esta Política de Privacidade temporária descreve como as informações pessoais são coletadas, usadas e compartilhadas quando você utiliza nosso aplicativo.

1. Informações Coletadas

Ao utilizar nosso aplicativo, podemos coletar as seguintes informações:

Informações fornecidas voluntariamente por você, como nome, endereço de e-mail, e outras informações de contato.

Informações de uso, incluindo dados de interação com o aplicativo, páginas visitadas e recursos acessados.

2. Uso das Informações

As informações coletadas são utilizadas para:

Personalizar a sua experiência no aplicativo e apresentar conteúdos relevantes.

Melhorar a qualidade e desempenho do aplicativo.

Enviar atualizações, notificações e informações relacionadas ao serviço.

3. Compartilhamento de Informações

Não compartilhamos suas informações pessoais com terceiros, exceto quando necessário para fornecer os serviços solicitados ou quando exigido por lei.

4. Cookies e Tecnologias Semelhantes

Podemos utilizar cookies e tecnologias semelhantes para melhorar a experiência do usuário, entender o uso do aplicativo e personalizar conteúdos.

5. Segurança

Implementamos medidas de segurança para proteger suas informações contra acesso não autorizado ou divulgação.

6. Links para Sites de Terceiros

Nosso aplicativo pode conter links para sites de terceiros. Não somos responsáveis pelas práticas de privacidade desses sites. Recomendamos revisar as políticas de privacidade de cada site visitado.

7. Consentimento

Ao utilizar nosso aplicativo, você concorda com a coleta e uso das informações conforme descrito nesta Política de Privacidade temporária.

8. Alterações na Política de Privacidade

Reservamo-nos o direito de atualizar esta Política de Privacidade temporária a qualquer momento. Recomendamos verificar periodicamente se há alterações.

9. Contato

Se tiver dúvidas ou preocupações sobre esta Política de Privacidade temporária, entre em contato conosco através de ....

Última atualização: 08/01/2024
''',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
