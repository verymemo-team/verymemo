import 'dart:developer';

import 'package:verymemo/common/types/login_channel.dart';


List<LoginChannel> loginChannelConfigs = [
  LoginChannel(
    title: "동기화를 위한 가입",
    logo: "assets/images/img_logo_google.svg",
    onPressed: () => log("---> Google"),
  ),
  LoginChannel(
    title: "애플 아이디로 가입",
    logo: "assets/images/img_logo_apple.svg",
    onPressed: () => log("---> Apple"),
  ),
  LoginChannel(
    title: "비회원으로 시작",
    logo: "assets/icons/ic_user.svg",
    // onPressed: () => log("---> 비회원"),
    isUser: false,
  ),
];
