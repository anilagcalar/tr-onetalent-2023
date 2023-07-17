*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_28_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_28_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_28_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_28_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_28_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_28_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_28_T_ZMN                  .
CONTROLS: TCTRL_ZOT_28_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZOT_28_T_P_ITUR               .
TABLES: *ZOT_28_T_ZMN                  .
TABLES: ZOT_28_T_P_ITUR                .
TABLES: ZOT_28_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
