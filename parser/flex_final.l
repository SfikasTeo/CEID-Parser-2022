%option noyywrap yylineno nodefault 

%{
    #define ECHO fwrite( yytext, yyleng, 1, yyout )
	#include "bison_final.tab.h"
	
	short int stringflag=1;

   	extern void yyerror(const char* s);
    //Location Handling in the lexer : 
    int yycolumn =1;
    #define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno; \
        yylloc.first_column = yycolumn; yylloc.last_column = yycolumn+yyleng-1; \
        yycolumn += yyleng;
%}

%s MORE_POSINTS
%s PROPERTY
%s GAMEID
%s WIN

IG_SPACE [ \t]*
IG_NEWLINE [\n\r]*
POS_INTR [0-9]+\.[0-9]+
POS_INT [0-9]+
POS_INT28 [2-8]
STRING \"(\\.|\"\"|[^"\n])*\"
UNTERMSTRING \"(\\.|[^"\n])*$
BOOLEAN "true"|"false"
PROPERTY_STRING "\"id.drawId\""|"\"id.gameId\""|"\"id.prizeCategories\""|"\"id.drawBreak\""|"\"id.drawTime\""|"\"id.status\""|"\"id.visualDraw\""|"\"id.pricePoints\""|"\"id.winningNumbers\""|"\"id.wagerStatistics\""
GAMEID_VALUE 1100|1110|2100|2101|5103|5104|5106
WIN_POS_INT [1-9]|[1-3][0-9]|4[0-5]
ERROR_TOKEN .

%%

<MORE_POSINTS>"0" {ECHO; BEGIN(INITIAL); return '0';}
<MORE_POSINTS>"1" {ECHO; BEGIN(INITIAL); return '1';}
<MORE_POSINTS>{POS_INT28}  {ECHO; BEGIN(INITIAL); return POS_INT28 ;}
<PROPERTY>{PROPERTY_STRING} {ECHO; BEGIN(INITIAL); return PROPERTY_STRING ;}
<GAMEID>{GAMEID_VALUE} {ECHO; BEGIN(INITIAL); return GAMEID_VALUE;}
<WIN>{WIN_POS_INT} {ECHO; return WIN_POS_INT;}


{POS_INTR}  {ECHO; return POS_INTR ;}
{POS_INT}  {ECHO; return POS_INT ;}
{BOOLEAN}   {ECHO; return BOOLEAN ;}
{IG_SPACE}  {/*ignore*/ ECHO; }
{IG_NEWLINE} {/*ignore*/ ECHO; yycolumn=1;} 

{STRING} {
         if ((!strcmp(yytext,"\"last\"")&&stringflag))               {ECHO; return last;}
    else if ((!strcmp(yytext,"\"active\"")&&stringflag))             {ECHO; return active;}
    else if ((!strcmp(yytext,"\"gameId\"")&&stringflag))             {ECHO; BEGIN(GAMEID); return gameId;}
    else if ((!strcmp(yytext,"\"drawId\"")&&stringflag))             {ECHO; return drawId;}
    else if ((!strcmp(yytext,"\"drawTime\"")&&stringflag))           {ECHO; return drawTime;}
    else if ((!strcmp(yytext,"\"status\"")&&stringflag))             {ECHO; stringflag=0; return status;}
    else if ((!strcmp(yytext,"\"drawBreak\"")&&stringflag))          {ECHO; return drawBreak;}
    else if ((!strcmp(yytext,"\"visualDraw\"")&&stringflag))         {ECHO; return visualDraw;}
    else if ((!strcmp(yytext,"\"pricePoints\"")&&stringflag))        {ECHO; return pricePoints;}
    else if ((!strcmp(yytext,"\"amount\"")&&stringflag))             {ECHO; return amount;}
    else if ((!strcmp(yytext,"\"wagerStatistics\"")&&stringflag))    {ECHO; return wagerStatistics;}
    else if ((!strcmp(yytext,"\"columns\"")&&stringflag))            {ECHO; return columns;}
    else if ((!strcmp(yytext,"\"wagers\"")&&stringflag))             {ECHO; return wagers;}
    else if ((!strcmp(yytext,"\"addOn\"")&&stringflag))              {ECHO; return addOn;}
    else if ((!strcmp(yytext,"\"id\"")&&stringflag))                 {ECHO; BEGIN(MORE_POSINTS); return id;}
    else if ((!strcmp(yytext,"\"divident\"")&&stringflag))           {ECHO; return divident;}
    else if ((!strcmp(yytext,"\"winners\"")&&stringflag))            {ECHO; return winners;}
    else if ((!strcmp(yytext,"\"distributed\"")&&stringflag))        {ECHO; return distributed;}
    else if ((!strcmp(yytext,"\"jackpot\"")&&stringflag))            {ECHO; return jackpot;}
    else if ((!strcmp(yytext,"\"categoryType\"")&&stringflag))       {ECHO; BEGIN(MORE_POSINTS); return categoryType;}
    else if ((!strcmp(yytext,"\"fixed\"")&&stringflag))              {ECHO; return fixed;}
    else if ((!strcmp(yytext,"\"gameType\"")&&stringflag))           {ECHO; stringflag=0; return gameType;}
    else if ((!strcmp(yytext,"\"minimumDistributed\"")&&stringflag)) {ECHO; return minimumDistributed;}
    else if ((!strcmp(yytext,"\"prizeCategories\"")&&stringflag))    {ECHO; return prizeCategories;}
    else if ((!strcmp(yytext,"\"winningNumbers\"")&&stringflag))     {ECHO; return winningNumbers;}
    else if ((!strcmp(yytext,"\"list\"")&&stringflag))               {ECHO; BEGIN(WIN); return list;}
    else if ((!strcmp(yytext,"\"bonus\"")&&stringflag))              {ECHO; BEGIN(INITIAL); return bonus;}
    else if ((!strcmp(yytext,"\"content\"")&&stringflag))            {ECHO; return content;}
    else if ((!strcmp(yytext,"\"direction\"")&&stringflag))          {ECHO; return direction;}
    else if ((!strcmp(yytext,"\"property\"")&&stringflag))           {ECHO; BEGIN(PROPERTY); return property;}
    else if ((!strcmp(yytext,"\"ignoreCase\"")&&stringflag))         {ECHO; return ignoreCase;}
    else if ((!strcmp(yytext,"\"nullHandling\"")&&stringflag))       {ECHO; return nullHandling;}
    else if ((!strcmp(yytext,"\"sort\"")&&stringflag))               {ECHO; return sort;}
    else if ((!strcmp(yytext,"\"descending\"")&&stringflag))         {ECHO; return descending;}
    else if ((!strcmp(yytext,"\"ascending\"")&&stringflag))          {ECHO; return ascending;}
    else if ((!strcmp(yytext,"\"first\"")&&stringflag))              {ECHO; return first;}
    else if ((!strcmp(yytext,"\"size\"")&&stringflag))               {ECHO; return size;}
    else if ((!strcmp(yytext,"\"number\"")&&stringflag))             {ECHO; return number;}
    else if ((!strcmp(yytext,"\"totalPages\"")&&stringflag))         {ECHO; return totalPages;}
    else if ((!strcmp(yytext,"\"totalElements\"")&&stringflag))      {ECHO; return totalElements;}
    else if ((!strcmp(yytext,"\"numberOfElements\"")&&stringflag))   {ECHO; return numberOfElements;}
    else ECHO; stringflag=1; return STRING;
}
{UNTERMSTRING} {ECHO; yyerror("Unterminated String");}

"[" {ECHO; return '[';}
"]" {ECHO; return ']';}
":" {ECHO; return ':';}
"{" {ECHO; return '{';}
"}" {ECHO; return '}';}
"," {ECHO; return ',';}

{ERROR_TOKEN} {ECHO; yyerror("Unrecongized input - Error token invoked");}

%%

