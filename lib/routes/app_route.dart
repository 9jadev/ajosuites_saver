import 'package:ajosuite_saver/controllers/dashboard/addcirclecontroller.dart';
import 'package:ajosuite_saver/controllers/dashboard/savingcontroller.dart';
import 'package:ajosuite_saver/controllers/dashboard/singlesavingcontroller.dart';
import 'package:ajosuite_saver/controllers/firstpagecontroller.dart';
import 'package:ajosuite_saver/controllers/forgetpasswordcontroller.dart';
import 'package:ajosuite_saver/controllers/getbusinesscontroller.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:ajosuite_saver/controllers/dashboard/singlewithdrawalcontroller.dart';
import 'package:ajosuite_saver/controllers/loginpagecontroller.dart';
import 'package:ajosuite_saver/pages/dashboard/addcircle.dart';
import 'package:ajosuite_saver/pages/dashboard/addcirclesingle.dart';
import 'package:ajosuite_saver/pages/dashboard/home.dart';
import 'package:ajosuite_saver/pages/dashboard/moretransaction.dart';
import 'package:ajosuite_saver/pages/dashboard/profile.dart';
import 'package:ajosuite_saver/pages/dashboard/singlesavings.dart';
import 'package:ajosuite_saver/pages/dashboard/singlewithdrawal.dart';
import 'package:ajosuite_saver/pages/dashboard/withdrawals.dart';
import 'package:ajosuite_saver/pages/forgetpassword.dart';
import 'package:ajosuite_saver/pages/getbusiness.dart';
import 'package:ajosuite_saver/pages/loginpage.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/pages/firstpage.dart';
import 'package:ajosuite_saver/pages/welcomepage.dart';

List<GetPage> approutlist = [
  GetPage(
    name: '/firstpage',
    page: () => const FirstaPage(),
    transition: Transition.fadeIn,
    binding: BindingsBuilder(
      () => {Get.put(FirstPageController())},
    ),
  ),
  GetPage(
    name: '/welcomepage',
    page: () => const WelcomePage(),
    transition: Transition.fadeIn,
    binding: BindingsBuilder(
      () => {Get.put(FirstPageController())},
    ),
  ),
  GetPage(
    name: '/getbusiness',
    page: () => const GetBusiness(),
    transition: Transition.fadeIn,
    binding: BindingsBuilder(
      () => {Get.put(GetBusinessController())},
    ),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.fadeIn,
    binding: BindingsBuilder(
      () => {Get.put(LoginPageController())},
    ),
  ),
  GetPage(
    name: '/forgotpassword',
    page: () => const ForgotPassword(),
    transition: Transition.fadeIn,
    binding: BindingsBuilder(
      () => {Get.put(ForgotPasswordController())},
    ),
  ),
  GetPage(
    name: '/dashboard/home',
    page: () => const HomePage(),
    binding: BindingsBuilder(
      () => {Get.put(HomePageController())},
    ),
  ),
  GetPage(
    name: '/dashboard/saving',
    page: () => const WithdrawalPage(),
    binding: BindingsBuilder(
      () => {Get.put(SavingPageController())},
    ),
  ),
  GetPage(
    name: '/dashboard/singlewithdrawal',
    page: () => const Singlewithdrawal(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(SingleWithdrawalController())},
    ),
  ),
  GetPage(
    name: '/dashboard/singlesavings',
    page: () => const SingleSavings(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(SingleSavingsController())},
    ),
  ),
  GetPage(
    name: '/dashboard/moretransactions',
    page: () => const MoreTransactions(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(HomePageController())},
    ),
  ),
  GetPage(
    name: '/dashboard/profile',
    page: () => const Profile(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(HomePageController())},
    ),
  ),
  GetPage(
    name: '/dashboard/joincircle',
    page: () => const JoinCircle(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(AddCircleController())},
    ),
  ),
  GetPage(
    name: '/dashboard/joincirclesingle',
    page: () => const AddCirclSingle(),
    transition: Transition.fade,
    binding: BindingsBuilder(
      () => {Get.put(AddCircleController())},
    ),
  )
];

//ForgotPassword