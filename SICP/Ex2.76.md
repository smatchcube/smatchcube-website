---
layout: page
title:  "Exercise 2.76"
tags: mit-scheme scheme SICP solution
categories: SICP
---
With explicit dispatch in order to add a new operation we need to explicitly tell the generic operation to check each possible type for the object, if we want to add a type we need to add the code to dispatch on type in every procedure using this type (to call the right procedures associated with this type). We must also take care to have different names for every procedures.\\
With data-directed style adding an operator is simple, we only need to add the procedure in the table. If we want to add a new type we must build the constructors and selectors and put them in the table. No needs to take care of naming correctly the procedures, the table take care of it.\\
With message-passing adding an operator is tricky, we need to change each constructors to dispatch the new operator. Adding a type is easy, we only need to make the constructor with the internal dispatch on procedures.

Explicit dispatch is terrible for large systems, the scalability is really not great, too much changes and we must take care of the names of our procedures.\\
I think that message-passing is better when we are adding new types often because we don't have to change the rest of the system. If we are adding new operations often I think that data-directed style is clever because we don't have to change the constructors for each type.

