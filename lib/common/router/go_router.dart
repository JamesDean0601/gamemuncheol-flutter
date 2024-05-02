import 'package:gamemuncheol/common/router/redirect_injection_service.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/youtube_url_preview_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/view/splash_screen.dart';
import 'package:gamemuncheol/common/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(
  GoRouterRef ref, {
  required RedirectInjectionService redirectInjectionService,
}) {
  return GoRouter(
    initialLocation: SplashScreen.PATH,
    redirect: redirectInjectionService.redirectLogic,
    routes: [
      GoRoute(
        path: SplashScreen.PATH,
        name: SplashScreen.ROUTE_NAME,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: SocialAuthScreen.PATH,
        name: SocialAuthScreen.ROUTE_NAME,
        builder: (context, state) => const SocialAuthScreen(),
      ),
      GoRoute(
        path: OauthWebviewScreen.PATH,
        name: OauthWebviewScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          final SignInMethod signInMethod = extraData.data["signInMethod"];
          switch (signInMethod) {
            case SignInMethod.google:
              return OauthWebviewScreen.google();
            default:
              return OauthWebviewScreen.google();
          }
        },
      ),
      GoRoute(
        path: PrivacyPolicyHomeScreen.PATH,
        name: PrivacyPolicyHomeScreen.ROUTE_NAME,
        builder: (context, state) => PrivacyPolicyHomeScreen(),
      ),
      GoRoute(
        path: ChangeNicknameScreen.PATH,
        name: ChangeNicknameScreen.ROUTE_NAME,
        builder: (context, state) => const ChangeNicknameScreen(),
      ),
      GoRoute(
        path: HomeScreen.PATH,
        name: HomeScreen.ROUTE_NAME,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: SearchMatchScreen.PATH,
        name: SearchMatchScreen.ROUTE_NAME,
        builder: (context, state) => EnterYoutubeUrlScreen(),
      ),
      GoRoute(
        path: SelectStakeHolderScreen.PATH,
        name: SelectStakeHolderScreen.ROUTE_NAME,
        builder: (context, state) => const SelectStakeHolderScreen(),
      ),
      GoRoute(
        path: UploadVideoScreen.PATH,
        name: UploadVideoScreen.ROUTE_NAME,
        builder: (context, state) => const UploadVideoScreen(),
      ),
      GoRoute(
        path: EnterYoutubeUrlScreen.PATH,
        name: EnterYoutubeUrlScreen.ROUTE_NAME,
        builder: (context, state) => const EnterYoutubeUrlScreen(),
      ),
      GoRoute(
        path: YoutubeUrlPreviewScreen.PATH,
        name: YoutubeUrlPreviewScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return YoutubeUrlPreviewScreen.fromExtraData(extraData);
        },
      ),
      GoRoute(
        path: RequestGalleryPermissionScreen.PATH,
        name: RequestGalleryPermissionScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return RequestGalleryPermissionScreen.fromExtraData(extraData);
        },
      ),
      GoRoute(
        path: EnterFeedFormScreen.PATH,
        name: EnterFeedFormScreen.ROUTE_NAME,
        builder: (context, state) => const EnterFeedFormScreen(),
      ),
    ],
  );
}
