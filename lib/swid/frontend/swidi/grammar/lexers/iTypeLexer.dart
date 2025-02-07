import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iAnnotationListLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iLibraryScopePrefixLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iQualifiedLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iReferenceDeclarationPrefixLexer.dart';

abstract class ITypeLexer<T>
    implements
        IAnnotationListLexer<T>,
        ILibraryScopePrefixLexer<T>,
        IReferenceDeclarationPrefixLexer<T>,
        IQualifiedLexer<T> {
  const ITypeLexer();

  T type();
}
