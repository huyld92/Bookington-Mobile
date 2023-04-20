import 'package:bookington_v2_2/presentation/%20favourite_court_screen/binding/%20favourite_court_binding.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/favourite_court_screen.dart';
import 'package:bookington_v2_2/presentation/change_account_screen/biding/change_account_binding.dart';
import 'package:bookington_v2_2/presentation/change_account_screen/change_account_screen.dart';
import 'package:bookington_v2_2/presentation/change_password_screen/binding/change_password_binding.dart';
import 'package:bookington_v2_2/presentation/change_password_screen/change_password_screen.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/binding/choose_court_binding.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/choose_court_screen.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/binding/choose_slot_binding.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/choose_slot_screen.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/binding/voucher_binding.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/voucher_screen.dart';
import 'package:bookington_v2_2/presentation/competition_details/binding/competition_details_binding.dart';
import 'package:bookington_v2_2/presentation/competition_details/competition_details.dart';
import 'package:bookington_v2_2/presentation/competition_screen/binding/competition_binding.dart';
import 'package:bookington_v2_2/presentation/competition_screen/competition_screen.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/binding/court_details_binding.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/court_details_screen.dart';
import 'package:bookington_v2_2/presentation/create_new_password_screen/binding/create_new_password_binding.dart';
import 'package:bookington_v2_2/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:bookington_v2_2/presentation/forum_screen/biding/forum_binding.dart';
import 'package:bookington_v2_2/presentation/forum_screen/forum_screen.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/binding/history_binding.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/booking_history_screen.dart';
import 'package:bookington_v2_2/presentation/home_screen/binding/home_binding.dart';
import 'package:bookington_v2_2/presentation/home_screen/home_screen.dart';
import 'package:bookington_v2_2/presentation/login_screen/binding/login_binding.dart';
import 'package:bookington_v2_2/presentation/login_screen/login_screen.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/binding/match_details_binding.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/match_details_screen.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/binding/message_chat_binding.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/message_chat_screen.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/binding/messages_binding.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/messages_screen.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/binding/my_match_binding.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/my_match_screen.dart';
import 'package:bookington_v2_2/presentation/notification_screen/binding/notification_binding.dart';
import 'package:bookington_v2_2/presentation/notification_screen/notification_screen.dart';
import 'package:bookington_v2_2/presentation/payment_screen/binding/payment_binding.dart';
import 'package:bookington_v2_2/presentation/payment_screen/payment_screen.dart';
import 'package:bookington_v2_2/presentation/phone_send_otp_screen/binding/phone_send_otp_binding.dart';
import 'package:bookington_v2_2/presentation/phone_send_otp_screen/phone_send_otp_screen.dart';
import 'package:bookington_v2_2/presentation/profile_screen/binding/profile_binding.dart';
import 'package:bookington_v2_2/presentation/profile_screen/profile_screen.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/binding/registration_phone_binding.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/registration_phone_screen.dart';
import 'package:bookington_v2_2/presentation/report_screen/binding/report_binding.dart';
import 'package:bookington_v2_2/presentation/report_screen/report_screen.dart';
import 'package:bookington_v2_2/presentation/verify_screen/binding/verify_phone_number_binding.dart';
import 'package:bookington_v2_2/presentation/verify_screen/verify_phone_number_screen.dart';
import 'package:bookington_v2_2/presentation/search_page/binding/search_binding.dart';
import 'package:bookington_v2_2/presentation/search_page/search_screen.dart';
import 'package:bookington_v2_2/presentation/splash_screen/binding/splash_binding.dart';
import 'package:bookington_v2_2/presentation/splash_screen/splash_screen.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/binding/transaction_binding.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/transaction_screen.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/binding/wallet_binding.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/wallet_screen.dart';

import '../core/app_export.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';

  static const String favouriteScreen = '/favourite_screen';

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

  static const String chooseVoucherScreen = '/choose_voucher_screen';

  static const String messagesScreen = '/message_screen';

  static const String messageChatScreen = '/message_chat_screen';

  static const String historyBookingScreen = '/history_booking_screen';

  static const String transactionScreen = '/transaction_screen';

  static const String walletScreen = '/wallet_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String phoneSendOtpScreen = '/phone_send_otp_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String competitionScreen = '/competition_screen';

  static const String competitionDetailsScreen = '/competition_details_screen';

  static const String forumScreen = '/forum_screen';

  static const String myMatchScreen = '/my_match_screen';

  static const String matchDetailsScreen = '/match_details_screen';

  static const String changeAccountScreen = '/change_account_screen';

  static const String reportScreen = '/report_screen';

  static List<GetPage> pages = [

    GetPage(
      // name: initialRoute,
      name: favouriteScreen,
      page: () => const FavouriteCourtScreen(),
      bindings: [
        FavouriteCourtBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: changeAccountScreen,
      page: () =>  const ChangeAccountScreen(),
      bindings: [
        ChangeAccountBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: changePasswordScreen,
      page: () =>  ChangePasswordScreen(),
      bindings: [
        ChangePasswordBinding(),
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
      name: chooseVoucherScreen,
      page: () => const VoucherScreen(),
      bindings: [
        VoucherBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: competitionDetailsScreen,
      page: () => const CompetitionDetailsScreen(),
      bindings: [
        CompetitionDetailsBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: competitionScreen,
      page: () => const CompetitionScreen(),
      bindings: [
        CompetitionBinding(),
      ],
    ),

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
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
      bindings: [
        CreateNewPasswordBinding(),
      ],
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
      name: forumScreen,
      page: () => const ForumScreen(),
      bindings: [
        ForumBinding(),
      ],
      // middlewares: [RouteGuard()],
    ),

    GetPage(
      // name: initialRoute,
      name: historyBookingScreen,
      page: () => const HistoryBookingScreen(),
      bindings: [
        HistoryBinding(),
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
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: matchDetailsScreen,
      page: () => const MatchDetailsScreen(),
      bindings: [
        MatchDetailsBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: messageChatScreen,
      page: () => const MessageChatScreen(),
      bindings: [
        MessageChatBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: messagesScreen,
      page: () => const MessagesScreen(),
      bindings: [
        MessagesBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: myMatchScreen,
      page: () => const MyMatchScreen(),
      bindings: [
        MyMatchBinding(),
      ],
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

    GetPage(
      // name: initialRoute,
      name: paymentScreen,
      page: () => PaymentScreen(),
      bindings: [
        PaymentBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: phoneSendOtpScreen,
      page: () => PhoneSendOtpScreen(),
      bindings: [
        PhoneSendOtpBinding(),
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
      name: registrationPhoneScreen,
      page: () => RegistrationPhoneScreen(),
      bindings: [
        RegistrationPhoneBinding(),
      ],
    ),

    GetPage(
      // name: initialRoute,
      name: reportScreen,
      page: () => const ReportScreen(),
      bindings: [
        ReportBinding(),
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
      name: searchScreen,
      page: () => const SearchScreen(),
      bindings: [
        SearchBinding(),
      ],

    ),


    GetPage(
      name: initialRoute,
      // name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
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

    GetPage(
      // name: initialRoute,
      name: walletScreen,
      page: () => const WalletScreen(),
      bindings: [
        WalletBinding(),
      ],
    ),
  ];
}
