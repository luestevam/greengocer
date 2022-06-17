import 'package:flutter/material.dart';
import 'package:greengocer/src/auth/components/custom_text_field.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //PRIMEIRO CONTAINER
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),

          //SEGUNDO CONTAINER

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              color: Colors.white,
            ),

            //Email
            child: Column(
              children: [
                const CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),
                const CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                ),

                //BOTÃO DE ENTRAR
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                //Esqueceu a senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                //Divisor
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withAlpha(90),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('ou'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withAlpha(90),
                        ),
                      ),
                    ],
                  ),
                ),

                //BOTÃO DE NEW USER
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Criar Conta')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
