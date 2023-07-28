*&---------------------------------------------------------------------*
*& Report zot_28_p_sport
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_sport.

TYPES: BEGIN OF gty_torba,
         id    TYPE i,
         takim TYPE char30,
         ulke  TYPE char2,
         torba TYPE numc1,
       END OF gty_torba,

       BEGIN OF gty_grup,
         takim TYPE char30,
         ulke  TYPE char2,
         torba TYPE numc1,
       END OF gty_grup.

DATA: lv_indx   TYPE i,
      lv_indxin TYPE i.

DATA: lt_torbalar TYPE TABLE OF gty_torba.
DATA: ls_torba TYPE gty_torba.
DATA: a_grubu TYPE TABLE OF gty_grup,
      b_grubu TYPE TABLE OF gty_grup,
      c_grubu TYPE TABLE OF gty_grup,
      d_grubu TYPE TABLE OF gty_grup.
DATA: lv_boola TYPE bool,
      lv_boolb TYPE bool,
      lv_boolc TYPE bool,
      lv_boold TYPE bool.

lt_torbalar = VALUE #( ( id = 1  takim = 'Liverpool'       ulke = 'EN'    torba = 1 )
                    ( id = 2  takim = 'Bayern Munih'    ulke = 'DE'    torba = 1 )
                    ( id = 3  takim = 'Inter'           ulke = 'IT'    torba = 1 )
                    ( id = 4  takim = 'PSG'             ulke = 'FR'    torba = 1 )
                    ( id = 5  takim = 'Manchester City' ulke = 'EN'    torba = 2 )
                    ( id = 6  takim = 'PSV'             ulke = 'NE'    torba = 2 )
                    ( id = 7  takim = 'Porto'           ulke = 'PO'    torba = 2 )
                    ( id = 8  takim = 'Real Madrid'     ulke = 'ES'    torba = 2 )
                    ( id = 9  takim = 'B.Dortmund'      ulke = 'DE'    torba = 3 )
                    ( id = 10 takim = 'Galatasaray'     ulke = 'TR'    torba = 3 )
                    ( id = 11 takim = 'Marsilya'        ulke = 'FR'    torba = 3 )
                    ( id = 12 takim = 'AJAX'            ulke = 'NE'    torba = 3 )
                    ( id = 13 takim = 'AEK'             ulke = 'GR'    torba = 4 )
                    ( id = 14 takim = 'Roma'            ulke = 'IT'    torba = 4 )
                    ( id = 15 takim = 'FSCB'            ulke = 'RO'    torba = 4 )
                    ( id = 16 takim = 'Atletico Madrid' ulke = 'ES'    torba = 4 ) ).

lv_indx = 1.
WHILE lv_indx < 16.

  lv_boola = abap_false.
  lv_boolb = abap_false.
  lv_boolc = abap_false.
  lv_boold = abap_false.

  WHILE lv_boola = abap_false OR lv_boolb = abap_false OR lv_boolc = abap_false OR lv_boold = abap_false.
    DATA(lv_random_num) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                      min  = 1
                                                      max  = 4 )->get_next( ).
    READ TABLE lt_torbalar INTO ls_torba INDEX lv_indx.
    CASE lv_random_num.
      WHEN 1.
        IF lv_boola = abap_false.
          READ TABLE a_grubu INTO DATA(ls_a) WITH KEY ulke = ls_torba-ulke.
          IF sy-subrc <> 0 .
            READ TABLE a_grubu INTO DATA(ls_a2) WITH KEY torba = ls_torba-torba.
            IF sy-subrc <> 0 .
              APPEND VALUE #( takim = ls_torba-takim ulke = ls_torba-ulke torba = ls_torba-torba  ) TO a_grubu.
              lv_indx += 1.
              lv_boola = abap_true.
            ELSE.
            ENDIF.
          ELSE.
          ENDIF.
        ENDIF.
      WHEN 2.
        IF lv_boolb = abap_false.
          READ TABLE b_grubu INTO DATA(ls_b) WITH KEY ulke = ls_torba-ulke.
          IF sy-subrc <> 0 .
            READ TABLE b_grubu INTO DATA(ls_b2) WITH KEY torba = ls_torba-torba.
            IF sy-subrc <> 0 .
              APPEND VALUE #( takim = ls_torba-takim ulke = ls_torba-ulke torba = ls_torba-torba  ) TO b_grubu .
              lv_indx += 1.
              lv_boolb = abap_true.
            ELSE.
            ENDIF.
          ELSE.
          ENDIF.
        ENDIF.
      WHEN 3.
        IF lv_boolc = abap_false.
          READ TABLE c_grubu INTO DATA(ls_c) WITH KEY ulke = ls_torba-ulke.
          IF sy-subrc <> 0 .
            READ TABLE c_grubu INTO DATA(ls_c2) WITH KEY torba = ls_torba-torba.
            IF sy-subrc <> 0 .
              APPEND VALUE #( takim = ls_torba-takim ulke = ls_torba-ulke torba = ls_torba-torba  ) TO c_grubu.
              lv_indx += 1.
              lv_boolc = abap_true.
            ELSE.
            ENDIF.
          ELSE.
          ENDIF.
        ENDIF.
      WHEN 4.
        IF lv_boold = abap_false.
          READ TABLE d_grubu INTO DATA(ls_d) WITH KEY ulke = ls_torba-ulke.
          IF sy-subrc <> 0 .
            READ TABLE d_grubu INTO DATA(ls_d2) WITH KEY torba = ls_torba-torba.
            IF sy-subrc <> 0 .
              APPEND VALUE #( takim = ls_torba-takim ulke = ls_torba-ulke torba = ls_torba-torba  ) TO d_grubu.
              lv_indx += 1.
              lv_boold = abap_true.
            ELSE.
            ENDIF.
          ELSE.
          ENDIF.
        ENDIF.
    ENDCASE.
  ENDWHILE.
ENDWHILE.



cl_demo_output=>new(
)->write_text( 'A Grubu'
)->write_data( a_grubu
)->write_text( 'B Grubu'
)->write_data( b_grubu
)->write_text( 'C Grubu'
)->write_data( c_grubu
)->write_text( 'D Grubu'
)->write_data( d_grubu
)->display(  ).
