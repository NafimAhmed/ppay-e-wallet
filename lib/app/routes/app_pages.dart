import 'package:get/get.dart';
import 'package:p_pay/app/modules/edit_profile/bindings/edit_profile_bindings.dart';
import 'package:p_pay/app/modules/edit_profile/views/edit_profile_view.dart';

import '../modules/account_info/bindings/account_info_bindings.dart';
import '../modules/account_info/views/account_info_views.dart';
import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/views/activity_view.dart';
import '../modules/activity_detail/bindings/activity_detail_bindings.dart';
import '../modules/activity_detail/views/activity_detail_views.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/card_adding_form/bindings/card_adding_bindings.dart';
import '../modules/card_adding_form/views/card_adding_form_view.dart';
import '../modules/contact/bindings/contacts_bindings.dart';
import '../modules/contact/views/contacts_views.dart';
import '../modules/edit_card/bindings/edit_card_bindings.dart';
import '../modules/edit_card/views/edit_card_views.dart';
import '../modules/faq/bindings/faq_bindings.dart';
import '../modules/faq/views/faq_views.dart';
import '../modules/general_settings/bindings/general_settings_bindings.dart';
import '../modules/general_settings/views/general_settings_views.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_card/bindings/my_card_bindings.dart';
import '../modules/my_qr_code/views/my_qr_code_views.dart';
import '../modules/notification/bindings/notification_bindings.dart';
import '../modules/notification/views/notification_views.dart';
import '../modules/password_reset/views/password_reset_views.dart';
import '../modules/payment/bindings/payment_bindings.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/payment_confirmation/bindings/confirmation_bindings.dart';
import '../modules/payment_confirmation/views/confirmation_view.dart';
import '../modules/payment_form/bindings/payment_form_bindings.dart';
import '../modules/payment_form/views/payment_form_views.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/refer_code/bindings/refer_code_bindings.dart';
import '../modules/refer_code/views/refer_code_views.dart';
import '../modules/select_language/bindings/select_language_bindings.dart';
import '../modules/select_language/views/select_language_views.dart';
import '../modules/send_money/bindings/send_money_bindings.dart';
import '../modules/send_money/views/send_money_view.dart';
import '../modules/send_money_confirmation/bindings/confirmation_bindings.dart';
import '../modules/send_money_confirmation/views/confirmation_view.dart';
import '../modules/send_money_form/bindings/send_money_form_bindings.dart';
import '../modules/send_money_form/views/send_money_form_views.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/start_carosel/bindings/start_carosel_screen_bindings.dart';
import '../modules/start_carosel/views/start_carocel_screen_view.dart';
import '../modules/start_screen/bindings/start_screen_binding.dart';
import '../modules/start_screen/view/start_screen_view.dart';

// import 'package:p_pay/app/widgets/add_card_form.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.START_SCREEN_CAROSEL,
      page: () => const StartCaroselScreenView(),
      binding: StartCaroselScreenBindings(),
    ),
    GetPage(
      name: _Paths.START_SCREEN,
      page: () => const StartScreenView(),
      binding: StartScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY_FORM,
      page: () =>  SendMoneyFormView(
        emPhoneNumber: '',
      ),
      binding: SendMoneyFormBindings(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY,
      page: () => const SendMoneyViews(),
      binding: SendMoneyBindings(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_FORM,
      page: () => const PaymentFormView(),
      binding: PaymentFormBindings(),
    ),
    GetPage(
      name: _Paths.PAYMENT_CONFIRMATION,
      page: () => const PaymentConfirmationView(),
      binding: PaymentConfirmationBindings(),
    ),
    GetPage(
      name: _Paths.CONFIRMATION,
      page: () => const SendMoneyConfirmationView(),
      binding: SendMoneyConfirmationBindings(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CARD,
      page: () =>  EditCardView(),
      binding: EditCardBindings(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFO,
      page: () => const AccountInfoViews(),
      binding: AccountInfoBinndings(),
    ),
    GetPage(
      name: _Paths.GENERAL_SETTINGS,
      page: () => const GeneralSettingsViews(),
      binding: GeneralSettingBindings(),
    ),
    GetPage(
      name: _Paths.REFER_CODE,
      page: () => const ReferCodeViews(),
      binding: ReferCodeBindings(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationViews(),
      binding: NotificationBindings(),
    ),
    GetPage(
      name: _Paths.ACTIVITY_DETAIL,
      page: () => const ActivityDetailViews(),
      binding: ActivityDetailBindings(),
    ),
    GetPage(
      name: _Paths.SELECT_LANGUAGE,
      page: () => const SelectLanguageViews(),
      binding: SelectLanguageBingings(),
    ),
    GetPage(
      name: _Paths.FAQS,
      page: () => const FAQViews(),
      binding: FAQBindings(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactsViews(),
      binding: ContactBindings(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () =>  PasswordResetViews(),
      binding: ContactBindings(),
    ),
    GetPage(
      name: _Paths.MY_QR_CODE,
      page: () => const MyQRCodeViews(),
      binding: MycardBindings(),
    ),
    GetPage(
      name: _Paths.ADD_CARD_FORM,
      page: () =>  CardAddingFormView(),
      binding: CardAddingBindings(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBindings(),
    ),
  ];
}
