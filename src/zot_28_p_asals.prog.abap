*&---------------------------------------------------------------------*
*& Report zot_28_p_asals
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_asals.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_sayi1 TYPE i LENGTH 5 OBLIGATORY,
              P_sayi2 TYPE i LENGTH 5 OBLIGATORY.

 SELECTION-SCREEN END OF BLOCK b1.
  DATA sayac TYPE i.
  DATA(a) = P_sayi2.
  DATA(s) = p_sayi1.
  START-OF-SELECTION.


 if p_sayi1 < p_sayi2.
  WHILE  P_sayi1 < p_sayi2.

    sayac = 0.
    a = P_sayi2.
    WHILE a < s.
      IF s MOD a = 0.
        sayac = sayac + 1.
      ENDIF.
      a = a + 1.
    ENDWHILE.
    IF sayac = 0.
      WRITE: s.
    ENDIF.

  ENDWHILE.
  ELSE.
    cl_demo_output=>display( 'Birinci sayı ikinci sayıdan küçük olmalı' ).
 endif.
