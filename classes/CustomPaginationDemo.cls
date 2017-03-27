public without sharing class CustomPaginationDemo
{
public List < ContactWrapper > lstWrapper {get;set;} // Wrapper list to hold all the values
public List < ContactWrapper > lstSetController {get;set;} // Wrapper list to hold the values which are displayed on UI
public static String compareField {get;set;} // Holds the value of field on which the list needs to be sorted
public static String sortOrder {get;set;} // Sorting order (ASC/DESC)
CustomIterable obj; // Instance of Iterator
// Constructor
public CustomPaginationDemo()
{
lstWrapper = new List < ContactWrapper > ();
lstSetController = new List < ContactWrapper > ();
List < Contact > lstContact = [select id, name from Contact ]; // Generatinf the list of records
for (Contact cont: lstContact)
{
lstWrapper.add(new ContactWrapper(cont, false)); // Adding the values to wrapper
}
obj = new CustomIterable(lstWrapper); //Initializing the iterator
if(lstWrapper.size() > 5)
{
obj.setPageSize = 5;
}
else
{
obj.setPageSize = lstWrapper.size() ;
}
// Table size
next();
}
public Boolean hasNext
{
get
{
return obj.hasNext();
}
set;
}
public Boolean hasPrevious
{
get
{
return obj.hasPrevious();
}
set;
}
public void next()
{
lstSetController = obj.next();
}
public void previous()
{
lstSetController = obj.previous();
}
// Method used to sort
public void sortWrpLst()
{
ContactWrapper.compareField = compareField; // Assigning values to ContactWrapper for Sorting
ContactWrapper.sortOrder = sortOrder; // Assigning values to ContactWrapper for Sorting
lstWrapper.sort(); // Sorting th wrapper list
obj = new CustomIterable(lstWrapper);
obj.setPageSize = 5;
next();
}
}