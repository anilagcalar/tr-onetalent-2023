*&---------------------------------------------------------------------*
*& Report zot_28_abap_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_abap_dictionary.

DATA(lt_personel) = VALUE zot_00_tt_personel( ( id        = 1
                                                ad        = 'Sena Süyün'
                                                yas       = 18
                                                departman = 'ABAP'
                                                unvan     = 'Stajyer'
                                                ekip      =  VALUE zot_00_tt_ekip(
                                                             ( id = 2
                                                               ad = 'Yusuf Yüksel' )
                                                             ( id = 3
                                                               ad = 'Mustafa Özkaya') )
                     ) ).
