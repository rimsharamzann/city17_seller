
import 'package:city17_seller/source/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocUtils {
  static List<BlocProvider> get mainList => [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ];
}
