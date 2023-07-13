*&---------------------------------------------------------------------*
*& Report zot_28_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_28_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id   TYPE c LENGTH 10,
              p_twit TYPE c LENGTH 25.
SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_twitat  RADIOBUTTON GROUP g1 DEFAULT 'X' USER-COMMAND g1,
              p_twitdg RADIOBUTTON GROUP g1,
              p_tsil RADIOBUTTON GROUP g1,
              p_gos   RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.

DATA lt_tweet_modify TYPE TABLE OF zot_28_t_twtr.
* Bu buraya mıydı emin değilim sonra bak.

IF p_id = 0 AND p_twitat EQ 'X' OR p_id = 0 AND p_twitdg EQ 'X' OR p_id = 0 AND p_tsil EQ 'X'.
      cl_demo_output=>display( 'ID != O' ).
      ELSE.
      CASE 'X'.
      WHEN p_twitat.
      TRY.
            APPEND VALUE #(
            twid = p_id
            tweet = p_id ) TO lt_tweet_modify.
            INSERT zot_28_t_twtr FROM TABLE lt_tweet_modify.
            CATCH cx_sy_open_sql_db.
           cl_demo_output=>display( 'ID != O' ).
            ENDTRY.
*             Değiştirmek için update kullanıoyrduk.
            WHEN p_twitdg.
            UPDATE zot_28_t_twtr SET tweet = p_twit
             WHERE twid = p_id.
             WHEN p_tsil.
             DELETE FROM zot_28_t_twtr  WHERE twid = p_id.

            COMMIT WORK AND WAIT.
             WHEN p_gos.
             SELECT tweet
             FROM zot_28_t_twtr
          INTO TABLE @DATA(abapitter).
        cl_demo_output=>display( abapitter ).
    ENDCASE.
  ENDIF.
