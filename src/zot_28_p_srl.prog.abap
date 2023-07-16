*&---------------------------------------------------------------------*
*& Report zot_28_p_srl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_srl.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_numa TYPE i LENGTH 3 OBLIGATORY,
              p_kir TYPE i LENGTH 1 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
