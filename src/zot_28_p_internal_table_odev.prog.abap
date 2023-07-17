*&---------------------------------------------------------------------*
*& Report zot_28_p_internal_table_odev
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_internal_table_odev.

DATA: lt_table TYPE TABLE OF zot_00_t_materia.
DATA: ls_table TYPE zot_00_t_materia.
DATA: lt_table_new TYPE TABLE OF zot_00_t_materia.
DATA: ls_table_new TYPE zot_00_t_materia.


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
