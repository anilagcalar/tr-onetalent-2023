*&---------------------------------------------------------------------*
*& Report zot_28_p_tarih
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_tarih.

DATA: lv_date1 TYPE sy-datum,
      lv_date2 TYPE sy-datum,
      lv_time1 TYPE sy-uzeit,
      lv_time2 TYPE sy-uzeit,
      lv_days   TYPE i,
      lv_hours  TYPE i,
      lv_minutes TYPE i,
      lv_seconds TYPE i,
      lv_message TYPE string.

PARAMETERS: p_date1 TYPE sy-datum,
            p_time1 TYPE sy-uzeit,
            p_date2 TYPE sy-datum,
            p_time2 TYPE sy-uzeit.

START-OF-SELECTION.

  lv_date1 = p_date1.
  lv_date2 = p_date2.
  lv_time1 = p_time1.
  lv_time2 = p_time2.

  CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
    EXPORTING
      date_from         = lv_date1
      time_from         = lv_time1
      date_to           = lv_date2
      time_to           = lv_time2
    IMPORTING
      days              = lv_days
      hours             = lv_hours
      minutes           = lv_minutes
      seconds           = lv_seconds.

  lv_message = |Tarih 1: { p_date1 } Saat 1: { p_time1 }| &&
               |Tarih 2: { p_date2 } Saat 2: { p_time2 }| &&
               |Gün Farkı: { lv_days }| &&
               |Saat Farkı: { lv_hours }| &&
               |Dakika Farkı: { lv_minutes }| &&
               |Saniye Farkı: { lv_seconds }|.

  CALL FUNCTION 'POPUP_TO_DISPLAY_TEXT'
    EXPORTING
      textline1 = lv_message.
