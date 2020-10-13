import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class Auth {

  AadOAuth oauth;

  Auth(){
    final config = new Config(
        "0451d42a-eadd-43c5-bdd5-f892c6fd448c",
        "a34eda25-b280-451e-a1ad-583e8f6bc22b",
        "https://waytrips.onmicrosoft.com/a34eda25-b280-451e-a1ad-583e8f6bc22b/swagger offline_access",
        "https://login.live.com/oauth20_desktop.srf",
        clientSecret: "h1~AV1~im33Ye0ZxvBjA3~FvB3XaTdF~zq",
        isB2C: true,
        azureTenantName: "waytrips",
        userFlow: "B2C_1_SignIn",
        responseType: "code token"
    );

    oauth = new AadOAuth(config);
  }

  Future<String> getToken() async {
    if(!oauth.tokenIsValid())
    {
      try {
        await oauth.login();
      } catch (e) {
        throw Exception('Ошибка авторизации');
      }
    }

    return oauth.getAccessToken();
  }
}