

# Brief overview
This is a short project, coded in C, that manages a contact list using a doubly linked list. The program allows you to add or remove contacts, to search contacts by name and to display all the contacts. It also includes two sorting functions, each using a different sorting algorithm. <br/>


# Structure
- main.c --> main program logic
- contacts.c --> implementation of contact list functions, such as add, remove, search and display all contacts
- contacts.h --> header file associated to contacts.c
- sorting.c --> sorting functions implementation
- sorting.h --> header file associated to sorting.c


# Implementation of functionalities
### contacts.c
- list initialization 
- add a contact to the list
- remove a contact from the list
- empty the list
- search a contact by name
- display all contacts

### contacts.h
- swap function that is used by the sorting algorithms
- insertion sort function that sorts contacts by name
- bubble sort function that sorts contacts by age


# How to run
In order to run this program, you will first need to make sure you have a C compiler installed on your machine, such as GCC or MinGW. Next, you need to clone this project locally. In the end, you simply have to run it, either by using an IDE or directly from the command line. <br/>


1.	Să se afișeze reprezentanțele, autovehiculele pe care le au sau le-au avut un stoc, prețul lor de vânzare și seria de șasiu.
Apoi, pe baza informațiilor de mai sus să se afișeze care sunt reprezentanțele care au vândut autovehicule de valoare mai mare de un anumit număr de Euro, valoare care va fi introdusă de către manager, neluând în considerare reducerile acordate?

2.	Care sunt clienții și departamentele din care provin aceștia? 
Să se afișeze aceștia în ordine alfabetică a numelui, apoi a prenumelui.

3.	Care sunt autovehiculele care sunt sau au fost în stoc? Să se afișeze modelul și prețul de vânzare pentru autovehiculele care sunt încă în stoc, iar pentru restul să se afișeze și numărul facturii, data și ora vânzării și numele clientului către care s-a efectuat vânzarea.
Să se afișeze, apoi, doar autovehiculele care nu mai sunt în stoc.

4.	Care sunt valorile vânzărilor reprezentanțelor, cu tot cu reducere? 
Să se ordoneze reprezentanțele în funcție de performanța lor.


Apart from table creation, structure alteration and data insertion, it also contains views and queries, which are used to display relevant information, such as the performance of different selling locations.


This project contains 3 virtual machines: a machine that runs Windows Server, one that runs Windows Client and the last one running Ubuntu. The alterations made in each VM is thoroughly described in the README file.
