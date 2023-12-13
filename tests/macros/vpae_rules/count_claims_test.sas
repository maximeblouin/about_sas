/* Generate test data */
data test_data;
    input ansin nodoss $ coverage $ expected;
    datalines;
2022 Claim1 PROP 1
2022 Claim1 PROP 0
2022 Claim2 PROP 1
2022 Claim2 RESP 1
2022 Claim3 RESP 1
2023 Claim3 RESP 1
;
run;

/* Run the macro with the test data */
%count_claims(test_data)

/* Check if the nbDoss variable was created */
proc print data=test_data;
run;
