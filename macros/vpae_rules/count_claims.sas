/**
  \file
  \ingroup VPAE_DATA_RULES
  \author  Maxime Blouin
  \brief   Macro for counting claims by ansin, nodoss, and coverage.
  \param   io_dsn The dataset to add the nbDoss variable
*/

/** \cond */

%macro count_claims(io_dsn);/* Check if required variables exist */
    /* Convert variable names to lowercase for case-insensitive check */
    %let lc_ansin = %lowcase(ansin);
    %let lc_nodoss = %lowcase(nodoss);
    %let lc_coverage = %lowcase(coverage);
    %let lc_nbDoss = %lowcase(nbDoss);

    %if not %sysfunc(varnum(&io_dsn., &lc_ansin.)) %then %do;
        %put ERROR: Variable ansin does not exist in &io_dsn.;
        %return; /* Exit macro */
    %end;
    %if not %sysfunc(varnum(&io_dsn., &lc_nodoss.)) %then %do;
        %put ERROR: Variable nodoss does not exist in &io_dsn.;
        %return; /* Exit macro */
    %end;
    %if not %sysfunc(varnum(&io_dsn., &lc_coverage.)) %then %do;
        %put ERROR: Variable coverage does not exist in &io_dsn.;
        %return; /* Exit macro */
    %end;

    /* Check if nbDoss variable already exists */
    %if %sysfunc(varnum(&io_dsn., &lc_nbDoss.)) %then %do;
        %put WARNING: Variable nbDoss already exists in &io_dsn.;
    %end;

    /* SAS code logic for counting claims by ansin, nodoss, and coverage */
    proc sort data=&io_dsn.;
        by ansin nodoss coverage;
    run;

    data &io_dsn.;
        set &io_dsn.;
        by ansin nodoss coverage;
        if first.coverage then nbDoss = 1;
        else nbDoss = 0;
    run;

%mend count_claims;

/** \endcond */