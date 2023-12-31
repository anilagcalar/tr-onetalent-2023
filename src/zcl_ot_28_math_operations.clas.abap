*Class'ın Definition ve implementation kısmı vardır. Definition kısmı metodlarımı tanımladığım yerdir.
*
CLASS zcl_ot_28_math_operations DEFINITION
   PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: calculate_result
      IMPORTING iv_number1   TYPE i
                iv_number2   TYPE i
                iv_operation TYPE c
      EXPORTING ev_result    TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ot_28_math_operations IMPLEMENTATION.
  METHOD calculate_result.

    CASE iv_operation.
      WHEN '+'.
        ev_result = iv_number1 + iv_number2.
      WHEN '-'.
        ev_result = iv_number1 - iv_number2.
      WHEN '*'.
        ev_result = iv_number1 * iv_number2.
      WHEN '/'.
        ev_result = iv_number1 / iv_number2.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
