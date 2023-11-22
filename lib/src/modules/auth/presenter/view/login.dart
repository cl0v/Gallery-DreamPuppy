import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.fromTitle,
    required this.shouldRedirect,
  });

  final String fromTitle;
  final bool shouldRedirect;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: widget.fromTitle,
        middle: const Text('Entrar'),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              Form.maybeOf(primaryFocus!.context!)?.save();
            },
            child: Column(
              children: [
                // logo
                const Gap(32),
                Center(
                    child: SizedBox(
                        height: 150, child: Assets.icons.logo512Png.image())),
                const Gap(32),
                CupertinoListSection.insetGrouped(
                  key: _formKey,
                  header: const Center(
                    child: Text(
                      'Seja bem vindo!',
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  backgroundColor: Colors.transparent,
                  children: [
                    CupertinoTextFormFieldRow(
                      prefix: const Text(
                        'Email',
                      ),
                      placeholder: ' E-mail ',
                      textAlign: TextAlign.center,
                    ),
                    CupertinoTextFormFieldRow(
                      prefix: const Text('Senha'),
                      textAlign: TextAlign.center,
                      placeholder: 'Senha',
                      obscureText: true,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  //TODO: Implementar esqueci minha senha
                  child: CupertinoButton(
                    onPressed: () => showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Alterar senha'),
                        actions: [
                          CupertinoButton(
                              onPressed: () => context.pop(),
                              child: const Text(
                                'Fechar',
                              ))
                        ],
                        content: const Text(
                          'Entre em contato no principal canal de atendimento para alterar a senha. [Whats App]',
                        ),
                      ),
                    ),
                    key: const Key('btnForgotPassword'),
                    // onTap: onForgotPassword,
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),

                const Gap(32),

                CupertinoButton.filled(
                    child: const Center(child: Text('Entrar')),
                    onPressed: () {}),

                /*
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Ou continue com',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //      TODO: google button
                //     // SquareTile(imagePath: 'lib/images/google.png'),

                //     SizedBox(width: 25),

                //     TODO: apple button
                //     // SquareTile(imagePath: 'lib/images/apple.png')
                //   ],
                // ),
                */

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'É novo por aqui?',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    CupertinoButton(
                      key: const Key('btnRegister'),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      onPressed: () async {
                        // try {
                        //   await Modular.to
                        //       .pushReplacementNamed('/user/login/create');
                        // } catch (e) {
                        //   print(e);
                        // }
                        context.pushNamed('signup');
                      },
                      child: const Text(
                        'Cadastrar agora',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
