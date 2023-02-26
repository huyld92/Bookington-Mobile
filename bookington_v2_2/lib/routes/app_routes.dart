import 'package:bookington_v2_2/presentation/choose_court_screen/binding/choose_court_binding.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/choose_court_screen.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/binding/choose_slot_binding.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/choose_slot_screen.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/binding/court_details_binding.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/court_details_screen.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:bookington_v2_2/presentation/history_screen/binding/history_binding.dart';
import 'package:bookington_v2_2/presentation/history_screen/history_screen.dart';
import 'package:bookington_v2_2/presentation/home_screen/binding/home_binding.dart';
import 'package:bookington_v2_2/presentation/home_screen/home_screen.dart';
import 'package:bookington_v2_2/presentation/login_screen/binding/login_binding.dart';
import 'package:bookington_v2_2/presentation/login_screen/login_screen.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/binding/message_chat_binding.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/message_chat_screen.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/binding/messages_binding.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/messages_screen.dart';
import 'package:bookington_v2_2/presentation/notification_screen/binding/notification_binding.dart';
import 'package:bookington_v2_2/presentation/notification_screen/notification_screen.dart';
import 'package:bookington_v2_2/presentation/payment_screen/binding/payment_binding.dart';
import 'package:bookington_v2_2/presentation/payment_screen/payment_screen.dart';
import 'package:bookington_v2_2/presentation/profile_screen/binding/profile_binding.dart';
import 'package:bookington_v2_2/presentation/profile_screen/profile_screen.dart';
 import 'package:bookington_v2_2/presentation/recommend_screen/recommend_screen.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/binding/registration_phone_binding.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/registration_phone_screen.dart';
import 'package:bookington_v2_2/presentation/registration_verify_screen/binding/verify_phone_number_binding.dart';
import 'package:bookington_v2_2/presentation/registration_verify_screen/verify_phone_number_screen.dart';
import 'package:bookington_v2_2/presentation/search_page/binding/search_binding.dart';
import 'package:bookington_v2_2/presentation/search_page/search_screen.dart';
import 'package:bookington_v2_2/presentation/splash_screen/binding/splash_binding.dart';
import 'package:bookington_v2_2/presentation/splash_screen/splash_screen.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/binding/transaction_binding.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/transaction_screen.dart';

import '../core/app_export.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';

  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String registrationPhoneScreen = '/registration_phone_screen';

  static const String verifyPhoneNumberScreen = '/verify_screen';

  static const String homeScreen = '/home_screen';

  static const String notificationScreen = '/notification_screen';

  static const String recommendScreen = '/recommend_screen';

  static const String searchScreen = '/search_screen';

  static const String profileScreen = '/profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String paymentScreen = '/payment_screen';

  static const String courtDetailsScreen = '/court_details_screen';

  static const String chooseCourtScreen = '/choose_court_screen';

  static const String chooseSlotScreen = '/choose_slot_screen';

  static const String messagesScreen = '/message_screen';

  static const String messageChatScreen = '/message_chat_screen';

  static const String historyScreen = '/history_screen';

  static const String transactionScreen = '/transaction_screen';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      // name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: registrationPhoneScreen,
      page: () => RegistrationPhoneScreen(),
      bindings: [
        RegistrationPhoneBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: verifyPhoneNumberScreen,
      page: () => VerifyPhoneNumberScreen(),
      bindings: [
        VerifyPhoneNumberBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
      // middlewares: [RouteGuard()],
    ),

    GetPage(
      // name: initialRoute,
      name: notificationScreen,
      page: () => const NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
      // middlewares: [RouteGuard()],
    ),
    //
    // GetPage(
    //   // name: initialRoute,
    //   name: recommendScreen,
    //   page: () => const RecommendScreen(),
    //   bindings: [
    //     RecommendBinding(),
    //   ],
    // ),
    GetPage(
      // name: initialRoute,
      name: courtDetailsScreen,
      page: () => const CourtDetailsScreen(),
      bindings: [
        CourtDetailsBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: chooseCourtScreen,
      page: () => const ChooseCourtScreen(),
      bindings: [
        ChooseCourtBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: chooseSlotScreen,
      page: () => const ChooseSlotScreen(),
      bindings: [
        ChooseSlotBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: searchScreen,
      page: () => const SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: profileScreen,
      page: () => const ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
      // middlewares: [RouteGuard()],
    ),
    GetPage(
      // name: initialRoute,
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
      // middlewares: [RouteGuard()],
    ),
    GetPage(
      // name: initialRoute,
      name: paymentScreen,
      page: () => const PaymentScreen(),
      bindings: [
        PaymentBinding(),
      ],
    ),
    GetPage(
      // name: initialRoute,
      name: messageChatScreen,
      page: () => MessageChatScreen(),
      bindings: [
        MessageChatBinding(),
      ],
    ),

    GetPage(

      // name: initialRoute,
      name: messagesScreen,
      page: () => MessagesScreen(),
      bindings: [
        MessagesBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: historyScreen,
      page: () => const HistoryScreen(),
      bindings: [
        HistoryBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: transactionScreen,
      page: () => const TransactionScreen(),
      bindings: [
        TransactionBinding(),
      ],
    ),
  ];
}
