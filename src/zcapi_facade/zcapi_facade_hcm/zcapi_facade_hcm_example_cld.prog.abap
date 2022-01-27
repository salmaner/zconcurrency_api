*&---------------------------------------------------------------------*
*& Include          ZCAPI_FACADE_HCM_EXAMPLE_CLD
*&---------------------------------------------------------------------*
CLASS lcl_app DEFINITION FINAL.
  PUBLIC SECTION.

    CLASS-DATA:
      gt_pernrs TYPE zif_capi_facade_hcm_context=>ty_t_pernrs.

    CLASS-METHODS:
      end_of_selection,
      start_of_selection.

ENDCLASS.
*----------------------------------------------------------------------*
*       CLASS lcl_context DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_context DEFINITION INHERITING FROM zcl_capi_facade_hcm_abstr_cntx FINAL.
  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_params,
        begda TYPE d,
        endda TYPE d,
      END OF ty_params.

    METHODS:
      constructor IMPORTING is_params TYPE ty_params,
      get_params RETURNING VALUE(rs_params) TYPE ty_params.

  PRIVATE SECTION.

    DATA ms_params TYPE ty_params.

ENDCLASS.
*----------------------------------------------------------------------*
*       CLASS lcl_task DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_task DEFINITION INHERITING FROM zcl_capi_facade_hcm_abstr_task FINAL.
  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING io_context TYPE REF TO zcl_capi_facade_hcm_abstr_cntx,
      zif_capi_callable~call REDEFINITION.

  PRIVATE SECTION.

    DATA ms_params TYPE lcl_context=>ty_params.

ENDCLASS.
*----------------------------------------------------------------------*
*       CLASS lcl_result DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_result DEFINITION FINAL.
  PUBLIC SECTION.

    INTERFACES zif_capi_facade_hcm_result.

    TYPES:
      BEGIN OF ty_employees,
        pernr TYPE n LENGTH 8,
        ename TYPE string,
      END OF ty_employees,

      ty_t_employees TYPE STANDARD TABLE OF ty_employees WITH KEY pernr.

    METHODS:
      constructor IMPORTING it_employees TYPE ty_t_employees.

  PRIVATE SECTION.

    DATA mt_employees TYPE ty_t_employees.

ENDCLASS.
