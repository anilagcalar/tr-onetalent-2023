*&---------------------------------------------------------------------*
*& Report zot_28_second_day_data_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_second_day_data_objects.


DATA: gv_ogrenci_adi TYPE char10,
      gv_ogrenci_soyadi TYPE char12,
      gv_tarih TYPE sy-datum.


      gv_ogrenci_adi    = 'Anıl'.
      gv_ogrenci_soyadi = 'Ağcalar'.
      gv_tarih          = sy-datum.

      cl_demo_output=>write( gv_ogrenci_adi ).

      cl_demo_output=>display(  ).


    """""""""""""""""""""""""""""""""""""""""

    DATA: lv_number1 TYPE i,
          lv_number2 TYPE i.
