PROGRAM DateIODriver(INPUT, OUTPUT);
USES DateIO;
VAR
  Mo: Month;
BEGIN{DateIODriver}
  ReadMonth(INPUT, Mo);
  WriteMonth(OUTPUT, Mo)
END.{DateIODriver}
