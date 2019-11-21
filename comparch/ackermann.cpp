#include <iostream>			// cout
#include <time.h> 			// for timer

int main(){


	return 0;
}

SELECT statement is used to query data. simple select statement consists of two clause; SELECT and FROM. The SELECT clause specifies the data items to be retrieved by the query usually specified by a select list. This is a list of select items separated by a comma. Each item in the list can be a Column Name, constant or SQL expression. Column must be a column from the table specified in the WHERE clause. When declaring a column name we use the form table_name.column_name. The keyword FROM, followed by a list of tables that the query accesses. SQL allows the use of the (*) to query all columns of a table. If query contains primary key there will be no duplicates otherwise it can. Inserting keyword DISTINCT can eliminate duplicate rows, keyword ALL allows duplicates.

SELECT can be used to implement PROJECT relational algebra operator. SELECT can be used to answer questions on data ie. how many?. SELECT returns data in the form of query results. clauses in SELECT must be in syntactical order and may also have to qualify the names of database objects ie.  database.owner.table_name.column_name. Optional SELECT clauses for functionality are; Select, From, WHERE, GROUP BY, HAVING, ORDER BY. 

Query results can contain NULL if column(s) retrieved contained NULL.

Expression Operators are used to request calculated columns. Can use Arithmetic, Time/Date and String operators. Arithmetic includes Addition, Subtraction, Multiplication and Division. Parenthesis should be used to indicate precedence. Date operators are date + number, date - number, date - date. String operators are '||' (Concatenation).

WHERE clause followed by search condition that specifies rows. Relational algebra operator sometimes called RESTRICT.

SEARCH Conditions predicates; Comparison, Range, Set Membership, Pattern Matching and Null Value Test. Combined using AND, OR, NOT. range test uses BETWEEN keyword.