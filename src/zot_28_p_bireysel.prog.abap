*&---------------------------------------------------------------------*
*& Report zot_28_p_bireysel
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_bireysel.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE i,
              p_num2 TYPE i.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_add RADIOBUTTON GROUP g1 DEFAULT 'X' USER-COMMAND g1,
              p_sub  RADIOBUTTON GROUP g1,
              p_multi RADIOBUTTON GROUP g1,
              p_divide  RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.


    START-OF-SELECTION.
  CASE 'X'.
*    WHEN p_add.
*      cl_demo_output=>display( p_num1 + p_num2 ).
    WHEN p_sub.
      cl_demo_output=>display( p_num1 - p_num2 ).
    WHEN p_multi.
      cl_demo_output=>display( p_num1 * p_num2 ).
    WHEN p_divide.
      TRY.
          cl_demo_output=>display( p_num1 / p_num2 ).
        CATCH cx_sy_zerodivide.
          cl_demo_output=>display( 'Division by zero error' ).
      ENDTRY.
  ENDCASE.
