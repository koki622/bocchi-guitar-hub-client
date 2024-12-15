import 'package:bocchi_guitar_hub_client/presentation/page/loading_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    // レスポンシブ対応
    return ScreenUtilInit(
      // ターゲットデバイスの設定
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // キーボードを開いているときなどにページをタップするとfocusを外せる
          home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            // ロード画面をメインの画面に重ねる
            child: Stack(
              children: [
                MaterialApp.router(
                  title: 'BocchiGuitarHub',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  routerConfig: router,
                ),
                const LoadingScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
