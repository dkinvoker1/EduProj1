import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'getItInstance.config.dart';

final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: r'$initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() => $initGetIt(getIt);