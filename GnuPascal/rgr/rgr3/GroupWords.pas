PROGRAM GroupWords(INPUT, OUTPUT);
USES UsesStemmer;
{
CONST

TYPE
}
VAR
  Word, Subst: STRING;
BEGIN {GroupWords}
  Word := 'выбравшись';
  Subst := SubGerund(Word);
  WRITELN(Subst);
END. {GroupWords}
