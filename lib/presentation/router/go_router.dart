import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/audio_player.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/practice_page.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/top_page.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/page_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider(
  (ref) {
    // GoRouterの設定
    final routes = [
      GoRoute(
        path: PageId.top.path,
        name: PageId.top.routeName,
        builder: (context, state) {
          return const TopPage();
        },
      ),
      GoRoute(
        path: PageId.practice.path,
        name: PageId.practice.routeName,
        builder: (context, state) {
          return const PracticePage();
        },
      )
    ];

    return GoRouter(
      initialLocation: PageId.top.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
