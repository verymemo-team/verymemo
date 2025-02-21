import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:verymemo/common/const/app_const.dart';
import 'package:verymemo/common/extensions/context_extension.dart';
import 'package:verymemo/common/extensions/widget_extension.dart';
import 'package:verymemo/common/ui/components/layout/variable_header.dart';
import 'package:verymemo/common/ui/components/layout/variable_nevbar.dart';
import 'package:verymemo/common/ui/components/list/memo_list/link_list.dart';
import 'package:verymemo/common/ui/components/tab/tab_menu.dart';
import 'package:verymemo/common/utils/image_util.dart';
import 'package:verymemo/externals/storage/storage_service.dart';
import 'package:verymemo/features/auth/presentation/auth_view.dart';
import 'package:verymemo/features/feed/presentation/feed_view.dart';
import 'package:verymemo/features/memo/presentation/memo_delete_view.dart';
import 'package:verymemo/features/memo/presentation/memo_edit_view.dart';
import 'package:verymemo/features/memo/presentation/memo_home_view.dart';
import 'package:verymemo/features/memo/presentation/memo_writing_view.dart';
import 'package:verymemo/features/saerch/presentation/search_view.dart';
import 'package:verymemo/features/settings/presentation/intro/intro_view.dart';
import 'package:verymemo/features/settings/presentation/permission/permission_view.dart';
import 'package:verymemo/features/settings/presentation/settings/settings_view.dart';
import 'package:verymemo/features/settings/presentation/profile/profile_setting_view.dart';

part 'app_routes.dart';
part 'app_router.dart';
part 'app_router_provider.dart';
part 'app_router_interceptor.dart';
part 'shell/home_scaffold.dart';
part 'shell/intro_scaffold.dart';
part 'shell/detail_scaffold.dart';

part 'router.g.dart';
