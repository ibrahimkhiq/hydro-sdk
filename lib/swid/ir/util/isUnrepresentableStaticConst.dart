import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/ir/swidStaticConst.dart';

bool isUnrepresentableStaticConst({
  required final SwidClass? parentClass,
  required final SwidStaticConst staticConst,
}) =>
    staticConst.when(
      fromSwidBooleanLiteral: (_) => false,
      fromSwidStringLiteral: (_) => false,
      fromSwidIntegerLiteral: (_) => false,
      fromDoubleLiteral: (_) => false,
      fromSwidStaticConstFunctionInvocation: (val) =>
          val.staticType.name[0] == "_",
      fromSwidStaticConstFieldReference: (_) => false,
      fromSwidStaticConstTopLevelVariableReference: (val) =>
          val.topLevelReference.name[0] != "_",
      fromSwidStaticConstPrefixedExpression: (val) =>
          isUnrepresentableStaticConst(
        parentClass: parentClass,
        staticConst: val.expression,
      ),
      fromSwidStaticConstBinaryExpression: (val) =>
          isUnrepresentableStaticConst(
            parentClass: parentClass,
            staticConst: val.leftOperand,
          ) ||
          isUnrepresentableStaticConst(
            parentClass: parentClass,
            staticConst: val.rightOperand,
          ),
      fromSwidStaticConstPrefixedIdentifier: (val) =>
          val.prefix.name[0] == "_" ||
          isUnrepresentableStaticConst(
            parentClass: parentClass,
            staticConst: SwidStaticConst.fromSwidStaticConstFieldReference(
              swidStaticConstFieldReference: val.staticConstFieldReference,
            ),
          ),
      fromSwidStaticConstIdentifier: (val) => val.enclosingType.name[0] == "_",
      fromSwidStaticConstListLiteral: (val) =>
          val.staticType.displayName[0] == "_" ||
          val.elements.any(
            (x) => isUnrepresentableStaticConst(
              parentClass: parentClass,
              staticConst: x,
            ),
          ),
      fromSwidStaticConstMapLiteralEntry: (val) =>
          isUnrepresentableStaticConst(
              parentClass: parentClass, staticConst: val.key) ||
          isUnrepresentableStaticConst(
            parentClass: parentClass,
            staticConst: val.value,
          ),
      fromSwidStaticConstMapLiteral: (val) =>
          val.staticType.displayName[0] == "_" ||
          val.elements.any(
            (x) => isUnrepresentableStaticConst(
              parentClass: parentClass,
              staticConst: SwidStaticConst.fromSwidStaticConstMapLiteralEntry(
                swidStaticConstMapLiteralEntry: x,
              ),
            ),
          ),
    );
