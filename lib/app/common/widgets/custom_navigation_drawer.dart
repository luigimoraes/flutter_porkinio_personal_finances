import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/themes/app_images.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';
import 'package:porkinio/app/features/sign_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primaryDark),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  visualDensity: VisualDensity.standard,
                  dense: true,
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  title: FittedBox(
                    child: Text(
                      '${locator.get<AuthService>().currentUser?.displayName}',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  subtitle: FittedBox(
                    child: Text(
                      '${locator.get<AuthService>().currentUser?.email}',
                      style: Theme.of(context).textTheme.overline?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(),
                  ),
                  Text(
                    "  Navegação de páginas  ",
                    style: Theme.of(context).textTheme.overline?.copyWith(
                          color: Colors.grey,
                          fontSize: 8,
                        ),
                  ),
                  const Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: const Icon(
                Icons.sentiment_satisfied_alt_rounded,
                color: AppColors.primary,
              ),
              title: Text(
                'Splash Screen',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SplashPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: const Icon(
                Icons.phone_android_rounded,
                color: AppColors.primary,
              ),
              title: Text(
                'Página de Login',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SignInPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: const Icon(
                Icons.description_outlined,
                color: AppColors.primary,
              ),
              title: Text(
                'Página de Cadastro',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SignUpPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: const Icon(
                Icons.settings_backup_restore_rounded,
                color: AppColors.primary,
              ),
              title: Text(
                'Recuperação de Conta',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(AccountRecoveryPage.route);
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(),
                      ),
                      Text(
                        "  Sobre o aplicativo  ",
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              color: Colors.grey,
                              fontSize: 8,
                            ),
                      ),
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDark,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Esse aplicativo foi desenvolvido em grupo como parte da formação do curso de Desenvolvimento Mobile em Flutter da PROZ Educação (Grupo 03, Turma 01 de 2022).',
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: AppColors.primaryDark),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDark,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.github,
                      filterQuality: FilterQuality.medium,
                      isAntiAlias: true,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'github.com/paulovgha',
                      style: Theme.of(context).textTheme.overline?.copyWith(
                            color: AppColors.primaryDark,
                            fontSize: 12,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDark,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.linkedin,
                      filterQuality: FilterQuality.medium,
                      isAntiAlias: true,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'linkedin.com/in/paulovgha',
                      style: Theme.of(context).textTheme.overline?.copyWith(
                            color: AppColors.primaryDark,
                            fontSize: 12,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
