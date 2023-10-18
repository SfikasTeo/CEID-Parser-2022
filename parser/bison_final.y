%{
    #define YYLTYPE_IS_DECLARED 1 /* alert the parser that we have our own definition */
    #include "Flex_Bison_header.h"

    int numWinNumbers = 0;
    int numPrizeCateg = 0;

%}
%locations //Adding the locaton code to the parser
%define parse.error verbose

//NAMING TOKENS
%token gameId
%token drawId
%token drawTime
%token status
%token drawBreak
%token visualDraw
%token pricePoints
%token amount
%token wagerStatistics
%token columns
%token wagers
%token addOn
%token prizeCategories
%token winningNumbers
%token list
%token bonus
%token id
%token divident
%token winners
%token distributed
%token jackpot
%token categoryType
%token fixed
%token gameType
%token minimumDistributed
%token last
%token active

%token totalPages
%token totalElements
%token numberOfElements
%token size
%token number
%token content
%token first
%token sort
%token direction
%token property
%token ignoreCase
%token nullHandling
%token descending
%token ascending

//DATA TYPE TOKENS
%token POS_INTR
%token POS_INT28
%token POS_INT
%token STRING
%token BOOLEAN
%token PROPERTY_STRING
%token GAMEID_VALUE
%token WIN_POS_INT

%%

jfile: jfile1 | jfile2 ;

jfile1: '{' last_field ',' active_field '}';
jfile2: '{' content_field ',' tpages_field ',' telements_field ',' lastb_field ',' numofelements_field ',' sort_field ',' first_field ',' size_field ',' number_field '}'; 

last_field:     last   ':' jsonObj2 ;       
active_field:   active   ':' '{' gameid_field ',' drawid_field ',' drawtime_field ',' status_field ',' drawbreak_field ',' visualdraw_field ',' pricepoints_field ',' prizecat_field ',' wagerstat_field '}' ;

gameid_field:   gameId ':' GAMEID_VALUE 
      |   gameId ':' POS_INT {lyyerror(@3, "Invalid game id value");}; 
drawid_field:   drawId  ':' POS_INT ;
drawtime_field:  drawTime  ':' POS_INT;  
status_field:  status  ':' STRING ; 
drawbreak_field:  drawBreak  ':' POS_INT ; 
visualdraw_field:   visualDraw  ':' POS_INT ; 
pricepoints_field:  pricePoints  ':' '{' amountfield '}' ;
amountfield:   amount   ':' POS_INTR ; 
win_num_field:   winningNumbers   ':' '{' list_field  {lowerNumInstances( "Count of parsed numbers: " , &numWinNumbers , 5); numWinNumbers = 0;}',' bonus_field '}' ;
bonus_field:   bonus   ':' '[' POS_INT ']';
list_field:     list ':' posintArray ; 

posintArray:'['  WIN_POS_INT ',' secintArray ']' {checkNumInstances( "Count of parsed numbers: " , &numWinNumbers , 5);}  ;
secintArray: WIN_POS_INT ',' secintArray  {checkNumInstances( "Count of parsed numbers: " , &numWinNumbers , 5);} 
            | WIN_POS_INT {checkNumInstances( "Count of parsed numbers: " , &numWinNumbers , 5);} 
            | POS_INT {lyyerror(@1, "Value out of allowed range (1-45)");}
            ;

wagerstat_field:   wagerStatistics   ':' '{' columns_field ',' wagers_field ',' addon_field '}' ;
columns_field: columns   ':' POS_INT ; 
wagers_field:   wagers   ':' POS_INT ; 
addon_field:   addOn   ':' generaljsonArray ; 

prizecat_field :     prizeCategories ':' jsonArray {lowerNumInstances( "Count of parsed json objects: " , &numPrizeCateg , 8); numPrizeCateg = 0;} ;
jsonArray: '['  jsonObj ',' secjsonArray ']' {checkNumInstances( "Count of parsed json objects: " , &numPrizeCateg , 8);} ;    
secjsonArray: jsonObj ',' secjsonArray {checkNumInstances( "Count of parsed json objects: " , &numPrizeCateg , 8);}
            | jsonObj  {checkNumInstances( "Count of parsed json objects: " , &numPrizeCateg , 8);}
            ;
generaljsonArray: '[' STRING ',' generaljsonArray2 ']'  
                | '[' POS_INT ',' generaljsonArray2 ']'
                | '[' POS_INTR ',' generaljsonArray2 ']'
                | '[' STRING ']'
                | '[' POS_INT ']'
                | '[' POS_INTR ']'
                | '['']'
                ;
generaljsonArray2: STRING ',' generaljsonArray2 
                 |  POS_INT ',' generaljsonArray2 
                 |  POS_INTR ',' generaljsonArray2 
                 |  STRING | POS_INT | POS_INTR 
                 ;

jsonObj:  '{' id1_field ',' divident_field',' winners_field',' distributed_field ',' jackpot_field ',' fixed_field ',' categorytype_field ',' gametype_field ',' mindistr_field '}' 
       |  '{' id2_field ',' divident_field',' winners_field',' distributed_field',' jackpot_field',' fixed_field',' categorytype_field',' gametype_field '}' 
       ;

id1_field:   id   ':' '1' ;
id2_field:   id   ':' POS_INT28;
  
divident_field: divident    ':' POS_INTR;

winners_field     :    winners   ':' POS_INT
            |    winners   ':' POS_INT28 
            |    winners   ':' '0'
            |    winners   ':' '1'
            ;
distributed_field     :   distributed   ':' POS_INTR;

jackpot_field         :   jackpot    ':' POS_INTR;

fixed_field           :   fixed    ':' POS_INTR;

categorytype_field    :   categoryType   ':' '0'
                |   categoryType    ':' '1' 
                ;


gametype_field        :   gameType   ':' STRING;
mindistr_field :   minimumDistributed   ':' POS_INTR;

tpages_field: totalPages ':' POS_INT;
telements_field: totalElements ':' POS_INT;
numofelements_field: numberOfElements ':' POS_INT;
size_field: size ':' POS_INT;
number_field: number ':' POS_INT;

content_field:  content ':'  jsonArray2 ; 
lastb_field:  last ':'  BOOLEAN ;
          ; 
first_field:  first ':'  BOOLEAN
          ;

jsonArray2:'['  jsonObj2 ',' secjsonArray2 ']' 
         | '[' jsonObj2 ']'
         | '['']' 
         ;

secjsonArray2: jsonObj2 ',' secjsonArray2
            | jsonObj2 
            ;

jsonObj2: '{' gameid_field ',' drawid_field ',' drawtime_field ',' status_field ',' drawbreak_field ',' visualdraw_field ',' pricepoints_field ',' win_num_field ',' prizecat_field ',' wagerstat_field '}' ;

sort_field    : sort ':' '['sortArray']' ;       
sortArray       : '{'direction_field ',' property_field ',' ignorecase_field ',' nullhandling_field ',' descending_field ',' ascending_field'}' ;
direction_field       : direction ':' STRING ;
property_field        : property ':' PROPERTY_STRING
                | property ':' STRING {lyyerror(@3, "Invalid property field-name");}; 
ignorecase_field      : ignoreCase ':' BOOLEAN ; 
nullhandling_field    : nullHandling ':' STRING ;
descending_field      : descending ':' BOOLEAN ;
ascending_field       : ascending ':' BOOLEAN ;

%%

// Color functions 
void red () {
  printf("\033[1;31m");
}
void black () {
  printf("\033[1;30m");
}
void reset () {
  printf("\033[0m");
}


void yyerror(const char * msg){

    printf("\n"); for(int i=0 ; i<yylloc.first_column; i++) printf(" ");
    red(); for(int i=yylloc.first_column ; i<yylloc.last_column; i++) printf("^"); reset();

    red(); printf("\nERROR DETECTED:"); reset();
    printf(" [ %s ] in line: %d, at columns: %d:%d \n", msg, yylloc.first_line, yylloc.first_column, yylloc.last_column);

    black();printf("-- JSON parsing failed --\n");reset();
    exit(1); 
}

void lyyerror(YYLTYPE t, const char *s){
    
        printf("\n"); for(int i=0 ; i<t.first_column; i++) printf(" ");
        red(); for(int i=t.first_column ; i<t.last_column; i++) printf("^"); reset();

        red(); printf("\nERROR DETECTED:"); reset();
        printf(" [ %s ] in line: %d, at columns: %d:%d \n", s, t.first_line, t.first_column, t.last_column);
        
        black();printf("-- JSON parsing failed --\n");reset();
        exit(1);        
}


void checkNumInstances(const char * msg, int* currentinstance, const int maxInstances){
  (*currentinstance)++;
  if (*currentinstance > maxInstances ) {
    printf("\n"); for(int i=0 ; i<yylloc.first_column; i++) printf(" ");
    red(); for(int i=yylloc.first_column ; i<yylloc.last_column; i++) printf("^"); reset();
    
    printf("\n"); for(int i=0 ; i<yylloc.first_column; i++) printf(" ");
    red(); for(int i=yylloc.first_column ; i<yylloc.last_column; i++) printf("^"); reset();

    red(); printf("\nERROR DETECTED:"); reset();
    printf(" [ %s %d -- ( Allowed number of instances is : %d) ] in line: %d\n", msg, *currentinstance, maxInstances , yylloc.first_line);

    black();printf("-- JSON parsing failed --\n");reset();
    exit(1); 
  }
}
void lowerNumInstances(const char * msg, int* currentinstance, const int maxInstances){
  if (*currentinstance < maxInstances ) {
    printf("\n"); for(int i=0 ; i<yylloc.first_column; i++) printf(" ");
    red(); for(int i=yylloc.first_column ; i<yylloc.last_column; i++) printf("^"); reset();

    red(); printf("\nERROR DETECTED:"); reset();
    printf(" [ %s %d -- ( Allowed number of instances is : %d) ] in line: %d\n", msg, *currentinstance, maxInstances , yylloc.first_line);

    black();printf("-- JSON parsing failed --\n");reset();
    exit(1); 
  }
}


int main ( int argc, char **argv  ) {
   if ( argc > 1 ){ 
        yyin = fopen( argv[1], "rb" );
    }
   else{
         perror("No argument has been given");
         exit(1);
   }
   
    if(!yyparse()) black(),printf("\n-- SUCCESS: JSON parse worked --\n"),reset();
    return 0;
}   