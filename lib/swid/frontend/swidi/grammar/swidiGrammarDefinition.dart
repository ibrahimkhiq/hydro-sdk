import 'package:petitparser/petitparser.dart';

import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iClassDefinitionLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iCompilationUnitLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iStartLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iTopLevelDefinitionLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiConstGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiDeclarationGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiFunctionDeclarationNamedParameterGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiFunctionDeclarationOptionalParameterGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiFunctionDeclarationPositionalParameterGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiFunctionGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiGrammarTokenizer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiIdentifierGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiLexicalTokensGrammarDefinition.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/swidiWhitespaceGrammarDefinition.dart';

class SwidiGrammarDefinition extends GrammarDefinition
    with
        SwidiWhitespaceGrammarDefinition,
        SwidiGrammarTokenizer,
        SwidiLexicalTokensGrammarDefinition,
        SwidiIdentifierGrammarDefinition,
        SwidiConstGrammarDefinition,
        SwidiDeclarationGrammarDefinition,
        SwidiFunctionDeclarationPositionalParameterGrammarDefinition,
        SwidiFunctionDeclarationOptionalParameterGrammarDefinition,
        SwidiFunctionDeclarationNamedParameterGrammarDefinition,
        SwidiFunctionGrammarDefinition
    implements
        IClassDefinitionLexer,
        ITopLevelDefinitionLexer,
        ICompilationUnitLexer,
        IStartLexer {
  const SwidiGrammarDefinition();

  @override
  Parser start() => ref0(compilationUnit).end();

  @override
  Parser compilationUnit() => ref0(topLevelDefinition).star();

  @override
  Parser topLevelDefinition() => ref0(classDefinition);

  @override
  Parser classDefinition() =>
      ref0(lexicalAbstract).optional() &
      ref0(lexicalClass) &
      ref0(libraryScopePrefix).optional() &
      ref0(identifier) &
      ref1(token, "{") &
      (ref0(functionDeclaration) | ref0(staticFunctionDeclaration)).star() &
      ref1(token, "}");
}
