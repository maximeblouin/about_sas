/**
*
* \brief SAS program demonstrating the use of the PROC EXPORT to Excel.
*
* \author Maxime Blouin
* \date 2023-10-06
*/

/** \cond */

/* Use this snippet to export multiple tables to one Excel (xlsx) file on 
different sheets.*/

%let l_xlsx = "<filename>"; /* Replace <path> with the Excel filename. */

proc export data=<dsn-1> /* Replace <dsn-1> with the first dataset name. */
            outfile=&l_xlsx.
            dbms=xlsx replace;
    sheet="<sheet-1>"; /* Replace <sheet-1> with the name of the first sheet name.*/
run;

proc export data=<dsn-2> /* Replace <dsn-2> with the second dataset name. */
            outfile=&l_xlsx.
            dbms=xlsx;
    sheet="<sheet-2>"; /* Replace <sheet-2> with the name of the second sheet name.*/
run;

/** \endcond */