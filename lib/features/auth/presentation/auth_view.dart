import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:verymemo/common/configs/login_channel_config.dart';
import 'package:verymemo/common/extensions/widget_extension.dart';
import 'package:verymemo/common/types/login_channel.dart';
import 'package:verymemo/common/ui/components/layout/gap.dart';
import 'package:verymemo/common/utils/image_util.dart';
import 'package:verymemo/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:verymemo/routers/router.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageUtil.showFullImage(
            "assets/images/img_join_screen.png",
          ),
        ),
        Column(
          children: [
            Container().flex(6),
            Column(
              children: [
                ImageUtil.showImage(
                  "assets/images/logo.svg",
                  size: const Size(50, 25),
                ),
                const Text("어디서든, 빠르게 베리 메모"),
                const Gap(48),
                Text("동기화를 위한 가입 or 비회원 시작"),
                LoginButtonRow(channels: loginChannelConfigs),
              ],
            ).flex(3),
          ],
        ),
      ],
    );
  }
}

class LoginButtonRow extends StatelessWidget {
  final List<LoginChannel> channels;
  const LoginButtonRow({super.key, required this.channels});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          channels.length,
          (index) => _CircleButton(
            channel: channels[index],
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends ConsumerWidget {
  final LoginChannel channel;
  const _CircleButton({required this.channel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInUseCase = ref.watch(signInUseCaseProvider);
    return GestureDetector(
      onTap: channel.isUser
          ? () {
              if (channel.title == "Google") {
                signInUseCase.signInWithGoogle();
              } else {
                signInUseCase.signInWithApple();
              }
            }
          : () => context.go(AppRoute.home),
      child: Stack(
        children: [
          if (!channel.isUser) ...[
            Container(
              width: 1,
              height: 70,
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
          ],
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: channel.isUser ? Colors.white : Colors.black,
              ),
              borderRadius: BorderRadius.circular(70),
              color: channel.isUser ? Colors.white : Colors.black,
            ),
            child: ImageUtil.showImage(
              channel.logo,
              size: const Size(24, 24),
              fit: BoxFit.cover,
            ).center,
          ),
        ],
      ),
    );
  }
}
