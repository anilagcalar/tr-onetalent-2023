*&---------------------------------------------------------------------*
*& Report zot_28_p_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_fibonacci.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_fno TYPE int4 OBLIGATORY,
            p_kir TYPE int1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  DATA: ilkg TYPE i VALUE 1,
        ikig TYPE i VALUE 1,
        i TYPE i VALUE 0.

  WHILE ilkg <= p_fno.
    IF i MOD  p_kir = 0.
      NEW-LINE.
      WRITE: / ilkg.
    ELSE.
      WRITE: ilkg.
    ENDIF.

    DATA(t) = ilkg + ikig.
    ilkg = ikig.
      ikig = t.
    i = i + 1.
  ENDWHILE.
