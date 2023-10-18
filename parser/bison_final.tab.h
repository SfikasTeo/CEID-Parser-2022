/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_BISON_FINAL_TAB_H_INCLUDED
# define YY_YY_BISON_FINAL_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    gameId = 258,
    drawId = 259,
    drawTime = 260,
    status = 261,
    drawBreak = 262,
    visualDraw = 263,
    pricePoints = 264,
    amount = 265,
    wagerStatistics = 266,
    columns = 267,
    wagers = 268,
    addOn = 269,
    prizeCategories = 270,
    winningNumbers = 271,
    list = 272,
    bonus = 273,
    id = 274,
    divident = 275,
    winners = 276,
    distributed = 277,
    jackpot = 278,
    categoryType = 279,
    fixed = 280,
    gameType = 281,
    minimumDistributed = 282,
    last = 283,
    active = 284,
    totalPages = 285,
    totalElements = 286,
    numberOfElements = 287,
    size = 288,
    number = 289,
    content = 290,
    first = 291,
    sort = 292,
    direction = 293,
    property = 294,
    ignoreCase = 295,
    nullHandling = 296,
    descending = 297,
    ascending = 298,
    POS_INTR = 299,
    POS_INT28 = 300,
    POS_INT = 301,
    STRING = 302,
    BOOLEAN = 303,
    PROPERTY_STRING = 304,
    GAMEID_VALUE = 305,
    WIN_POS_INT = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_BISON_FINAL_TAB_H_INCLUDED  */
