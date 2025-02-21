import 'dart:developer';

import 'package:verymemo/common/types/login_channel.dart';

List<LoginChannel> loginChannelConfigs = [
  LoginChannel(
    title: "Google",
    logo: "assets/images/img_logo_google.svg",
    onPressed: () => log("---> Google"),
  ),
  LoginChannel(
    title: "Apple",
    logo: "assets/images/img_logo_apple.svg",
    onPressed: () => log("---> Apple"),
  ),
  LoginChannel(
    title: "비회원",
    logo: "assets/icons/ic_user.svg",
    // onPressed: () => log("---> 비회원"),
    isUser: false,
  ),
];
