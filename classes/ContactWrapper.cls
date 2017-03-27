global class ContactWrapper implements Comparable // The compareble interface is used for sorting the Wrapper List
{
// Wrapper Structure Strats , this structure can be customized as per requirement—-
public Boolean isSelected {get;set;}
public Contact cont {get;set;}
// Wrapper Structure Ends —-
public static String compareField {get;set;} // Variable to hold the value of Field / Column for Sorting
public static String sortOrder {get;set;} // Variable to hold the order for Sorting (ASC/DESC)
// Constructor
public ContactWrapper(Contact cont, Boolean isSelected)
{
this.cont = cont;
this.isSelected = isSelected;
}
// Compareto is a required method that is used when we implement comparable interface.
public Integer compareTo(Object vCont)
{
ContactWrapper contToCompare = (ContactWrapper) vCont;
if ((String) cont.get(compareField) > (String) contToCompare.cont.get(compareField))
{
return sortOrder.equals('asc') ? 1 : 0;
}
else
{
return sortOrder.equals('desc') ? 0 : 1;
}
}
}