import 'package:get_it/get_it.dart';
import 'package:health_care/Helper/DatabaseHelper/DatabaseHelper.dart';
import 'package:health_care/Helper/DatabaseCRUDEHelper/DoctorsListCRUDE.dart';

GetIt getIt = GetIt.instance;

GetIt locator = GetIt.instance;

void locators(){
  locator.registerLazySingleton(() => DatabaseHelper('Doctors'));
  locator.registerLazySingleton(() => DoctorListCRUDE());
}