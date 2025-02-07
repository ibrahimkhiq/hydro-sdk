import 'package:analyzer/dart/ast/ast.dart';

import 'package:hydro_sdk/swid/frontend/dart/extractStaticConstFromSyntacticEntity.dart';
import 'package:hydro_sdk/swid/ir/swidStaticConstBinaryExpression.dart';

SwidStaticConstBinaryExpression
    swidStaticConstBinaryExpressionFromBinaryExpression({
  required final BinaryExpression binaryExpression,
}) =>
        SwidStaticConstBinaryExpression(
          operator: binaryExpression.operator.value() as String,
          leftOperand: extractStaticConstFromSyntacticEntity(
            syntacticEntity: binaryExpression.leftOperand,
          ),
          rightOperand: extractStaticConstFromSyntacticEntity(
            syntacticEntity: binaryExpression.rightOperand,
          ),
        );
