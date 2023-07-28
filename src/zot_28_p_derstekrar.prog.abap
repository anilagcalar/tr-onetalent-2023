*&---------------------------------------------------------------------*
*& Report zot_28_p_derstekrar
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_derstekrar.

DATA: gv_persid TYPE CHAR10,
      gv_persadi TYPE CHAR10,
      gv_pers_soyadi TYPE CHAR10,
      gs_persT TYPE ZOT_28_T_PERS,
      gt_perstt TYPE TABLE OF ZOT_28_T_PERS.

      SELECT * FROM ZOT_28_T_PERS
      INTO TABLE gt_perstt.
