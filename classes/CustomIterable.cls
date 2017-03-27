global class CustomIterable implements Iterator < list < ContactWrapper >> // The Iterator interface is used for pagination
{
list < ContactWrapper > InnerList {get;set;} // Holds all the values
list < ContactWrapper > ListRequested {get;set;} // Holds the value to be displayed on the Page
Integer i {get;set;}
public Integer setPageSize {get;set;}
//Constructor
public CustomIterable(List < ContactWrapper > lstAccWr)
{
InnerList = new list < ContactWrapper > ();
ListRequested = new list < ContactWrapper > ();
InnerList = lstAccWr;
setPageSize = 10;
i = 0;
}


global boolean hasNext()
{
if (i >= InnerList.size())
{
return false;
}
else
{
return true;
}
}

global boolean hasPrevious()
{
if (i <= setPageSize)
{
return false;
}
else
{
return true;
}
}


global list < ContactWrapper > next()
{
    ListRequested = new list < ContactWrapper > ();
    integer startNumber;
    integer size = InnerList.size();
    
    if (hasNext())
    {
        if (size <= (i + setPageSize))
        {
            startNumber = i;
            i = size;
        }
        else
        {
            i = (i + setPageSize);
            startNumber = (i- setPageSize);
        }
        
        for (integer start = startNumber; start < i; start++)
        {
            ListRequested.add(InnerList[start]);
        }
       }
    return ListRequested;
}

global list < ContactWrapper > previous()
{
    ListRequested = new list < ContactWrapper > ();
    integer size = InnerList.size();
    
    if (i == size)
    {
        if (math.mod(size, setPageSize) > 0)
        {
            i = size - math.mod(size, setPageSize);
        }
        else
        {
            i = (size - setPageSize);
        }
    }
     else
    {
        i = (i - setPageSize);
     }
        for (integer start = (i - setPageSize); start < i; ++start) {
        ListRequested.add(InnerList[start]);
        }
    return ListRequested;
    }
    }