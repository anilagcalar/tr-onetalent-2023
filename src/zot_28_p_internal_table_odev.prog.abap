*&---------------------------------------------------------------------*
*& Report zot_28_p_internal_table_odev
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_internal_table_odev.

DATA: lt_table TYPE TABLE OF zot_00_t_materia.
DATA: lt_table_new TYPE TABLE OF zot_00_t_materia.


START-OF-SELECTION.

  SELECT *
        INTO TABLE lt_table
        FROM zot_00_t_materia.


  lt_table_new = VALUE #( BASE lt_table_new   (
                                               matnr = '000000000000000001'
                                               maktx = 'Eşya1'
                                               matkl = 'C'
                                               menge = '10'
                                               meins = 'ST')
                                              (
                                               matnr = '000000000000000002'
                                               maktx = 'Eşya2'
                                               matkl = 'C'
                                               menge = '15'
                                               meins = 'ST')
                                               (
                                               matnr = '000000000000000003'
                                               maktx = 'Eşya3'
                                               matkl = 'C'
                                               menge = '20'
                                               meins = 'ST')
                                               (
                                               matnr = '000000000000000004'
                                               maktx = 'Eşya4'
                                               matkl = 'C'
                                               menge = '25'
                                               meins = 'ST')
                                               (
                                               matnr = '000000000000000005'
                                               maktx = 'Eşya5'

                                               matkl = 'C'
                                               menge = '30'
                                               meins = 'ST')
                                               ).

  LOOP AT lt_table INTO DATA(ls_table).
    READ TABLE lt_table_new INTO DATA(ls_table_new) WITH KEY meins = ls_table-meins.
    IF sy-subrc EQ 0.
      ls_table-menge = ls_table-menge + 10.
      MODIFY lt_table FROM ls_table.
    ENDIF.
  ENDLOOP.

    DATA lt_table_new2 TYPE TABLE OF zot_00_t_materia.
  APPEND LINES OF lt_table TO lt_table_new2.
  APPEND LINES OF lt_table_new TO lt_table_new2.

    TYPES: BEGIN OF lty_malzeme,
           matkl TYPE matkl,
           menge TYPE menge_d,
         END OF lty_malzeme.
  DATA: lt_malzeme_collect TYPE TABLE OF lty_malzeme.
  DATA: ls_malzeme_collect TYPE  lty_malzeme.

          LOOP AT lt_table_new2 INTO DATA(ls_table_new2).
    ls_malzeme_collect = VALUE #( matkl = ls_table_new2-matkl
                                  menge = ls_table_new2-menge ).
    COLLECT ls_malzeme_collect INTO lt_malzeme_collect.
  ENDLOOP.
