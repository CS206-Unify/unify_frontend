import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';
// --------------- Page Imports --------------- //
// --------------- Home page import --------------- //
import 'package:unify/widgets/home/screens/home_page.dart';

// --------------- Profile pages imports --------------- //
import 'package:unify/widgets/profile/screens/brawlstarsprofile_page.dart';
import 'package:unify/widgets/profile/screens/login_page.dart';
import 'package:unify/widgets/profile/screens/profile_page.dart';
import 'package:unify/widgets/profile/screens/registration_page.dart';
import 'package:unify/widgets/profile/screens/registrationdetails_page.dart';

// --------------- Discover pages imports --------------- //
import 'package:unify/widgets/discover/screens/discover_page.dart';
import 'package:unify/widgets/discover/screens/playerdetails_page.dart';
import 'package:unify/widgets/discover/screens/players_page.dart';
import 'package:unify/widgets/discover/screens/teamdetails_page.dart';
import 'package:unify/widgets/discover/screens/teams_page.dart';

// --------------- Manage pages imports --------------- //
import 'package:unify/widgets/manage/screens/createteam_page.dart';
import 'package:unify/widgets/manage/screens/editteam_page.dart';
import 'package:unify/widgets/manage/screens/manage_page.dart';

// --------------- Router --------------- //

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    // --------------- Home page --------------- //
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(title: "Unify");
      },
    ),

    // --------------- Profile pages --------------- //
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: '/brawl_stars_profile',
      builder: (BuildContext context, GoRouterState state) {
        return const BrawlStarsProfilePage();
      },
    ),
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const RegistrationPage();
        }),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegistrationDetailsPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),

    // --------------- Manage pages --------------- //
    GoRoute(
      path: '/manage',
      builder: (BuildContext context, GoRouterState state) {
        return const ManagePage();
      },
    ),
    GoRoute(
      path: '/edit_team/:id',
      builder: (BuildContext context, GoRouterState state) {
        return const EditTeamPage();
      },
    ),
    GoRoute(
      path: '/create_team/:id',
      builder: (BuildContext context, GoRouterState state) {
        return const CreateTeamPage();
      },
    ),

    // --------------- Discover pages --------------- //
    GoRoute(
      path: '/discover',
      builder: (BuildContext context, GoRouterState state) {
        return const DiscoverPage();
      },
    ),
    GoRoute(
      path: '/players',
      builder: (BuildContext context, GoRouterState state) {
        return const PlayersPage();
      },
    ),
    GoRoute(
      path: '/teams',
      builder: (BuildContext context, GoRouterState state) {
        return const TeamsPage();
      },
    ),
    GoRoute(
      path: '/player_details/:id',
      builder: (BuildContext context, GoRouterState state) {
        return const PlayerDetailsPage();
      },
    ),
    GoRoute(
      path: '/team_details/:id',
      builder: (BuildContext context, GoRouterState state) {
        return const TeamDetailsPage();
      },
    ),
  ],
  redirect: (context, state) async {
    // TODO: Remove during production
    final String? token = await SecureStorage.getToken();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      SecureStorage.deleteToken();
      prefs.setBool('first_run', false);
    }

    final bool loggedIn = !(token == null || token.isEmpty);
    // Check is user is in login or register or not
    final bool atLoginOrRegisterPage =
        state.matchedLocation == "/login" || state.matchedLocation == "/";
    if (loggedIn && atLoginOrRegisterPage) return "/home";
    if (!loggedIn && !atLoginOrRegisterPage) return "/";
    return null;
  },
);
