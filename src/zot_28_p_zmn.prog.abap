*&---------------------------------------------------------------------*
*& Report zot_28_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_zmn.

*NOTLARIM:(ÖDEV BİTTİKENSONRA NOTLARIM PROG OLUŞTURUP KOPYALA.)
*AT SELECTION-SCREEN. Herhangi bir değişim olduğunda gerçekleşecek olan işlemler. ( Ör butona tıklanması )
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_char. “P_char için ekran içerisinde yardım ekranı çağırıldığında olan işlemler.
*
*START-OF-SELECTION.   islemlerin yapılmaya başlandığı noktadır.
*
*END-OF-SELECTION.       Son olarak yapılacak işlemler.
*
*TOP-OF-PAGE         Sayfanın en üst kısmına yazılacak olan text belirlenir.
*
*AT SELECTION-SCREEN INPUT :Verilerin kontrolünü sağlar.
*
*AT SELECTION-SCREEN. Herhangi bir değişim olduğunda gerçekleşecek olan işlemler. ( Ör butona tıklanması )
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_char. “P_char için ekran içerisinde yardım ekranı çağırıldığında olan işlemler.
*
*START-OF-SELECTION.   islemlerin yapılmaya başlandığı noktadır.
*
*TYPES: BEGIN OF lty_table,
*  year_diff TYPE char10,
*  month_diff TYPE
*  day_diff TYPE
*  hour_diff TYPE
DATA gs_zmn TYPE zot_28_t_zmn.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.


SELECT-OPTIONS: s_id FOR gs_zmn-zamanid.

SELECTION-SCREEN END OF BLOCK b1.

  DATA: lv_ilktarih  TYPE dats,
        lv_sontarih  TYPE dats,
        lv_ilkzaman  TYPE tims,
        lv_sonzaman  TYPE tims,
        lv_days_diff TYPE i,
        lv_years     TYPE i,
        lv_months    TYPE i,
        lv_days      TYPE i,
        lv_seconds   TYPE i,
*        lt_table TYPE TABLE OF lty_table,
*        ls_table TYPE lty_table.


 START-OF-SELECTION.




  SELECT b_tarih,
         b_saat,
         s_tarih,
         s_saat
        FROM zot_28_t_zmn WHERE zamanid IN @s_id INTO TABLE @DATA(lt_zmnn).


  LOOP AT lt_zmnn INTO DATA(ls_date).

    lv_ilktarih = ls_date-b_tarih.
    lv_sontarih = ls_date-s_tarih.
    lv_ilkzaman = ls_date-b_saat.
    lv_sonzaman = ls_date-b_saat.

    lv_days_diff = CONV int4( lv_sontarih - lv_ilktarih ).

    lv_years = lv_days_diff DIV 365.
    lv_days_diff = lv_days_diff MOD 365.


    lv_months = lv_days_diff DIV 30.
    lv_days = lv_days_diff.


    CALL FUNCTION 'SWI_DURATION_DETERMINE'
      EXPORTING
        baslangic_tarih = lv_ilktarih
        bitis_tarihi    = lv_sontarih
        baslangic_saati = lv_ilkzaman
        bitis_saati     = lv_sonzaman
      IMPORTING
        duration        = lv_seconds.



    DATA(lv_s) = lv_seconds.
    DATA(lv_minutes) = lv_s DIV 60.
    DATA(lv_hour) = lv_s DIV 3600.

    IF sy-index MOD 6 = 0.
      NEW-LINE.
    ENDIF.

    IF lv_years NE 0.
      WRITE: |{ lv_years  } YIL|.
    ENDIF.
    IF lv_months NE 0.
      WRITE: |{ lv_months  } AY|.
    ENDIF.
    IF lv_days NE 0.
      WRITE: |{ lv_days } GÜN|.
    ENDIF.
    IF lv_hour NE 0.
      WRITE: |{ lv_hour } SAAT|.
    ENDIF.
    IF lv_minutes NE 0.
      WRITE: |{ lv_minutes } DAKİKA|.
    ENDIF.
    IF lv_s NE 0.
      WRITE: |{ lv_s } SANİYE|.
    ENDIF.
    WRITE: | { lv_years } YIL, { lv_months } AY, { lv_days } GÜN |.

  ENDLOOP.
*
*  Sonra deneyeceğim kodlar
*  DATA: seconds TYPE i VALUE 180001,
*days TYPE i,
*dur_ti LIKE sy-uzeit.
*
*days = seconds DIV 86400. "Seconds per day
*seconds = seconds MOD 86400.
*dur_ti = seconds.
*
*WRITE : /001 days, dur_ti.
*
* CCU_TIMESTAMP_DIFFERENCE. fonk ne işe yarar

*cl_demo_output=>display( lt_table ).
