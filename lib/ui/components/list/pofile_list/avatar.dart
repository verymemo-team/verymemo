import 'package:flutter/material.dart';

class AvatarConfig {
  final double avatarSize;
  final String? imageUrl;

  const AvatarConfig({
    required this.avatarSize,
    this.imageUrl,
  });

  static const String defaultImagePath = 'assets/images/default_profile.png';
}

//아바타 위젯
class Avatar extends StatelessWidget {
  final AvatarConfig config;

  const Avatar({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: config.avatarSize,
      height: config.avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        image: (config.imageUrl == null || config.imageUrl!.isEmpty)
            ? const DecorationImage(
                image: AssetImage(AvatarConfig.defaultImagePath),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: NetworkImage(config.imageUrl!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
