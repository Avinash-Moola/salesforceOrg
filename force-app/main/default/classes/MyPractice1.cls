public class MyPractice1 
{
	
	public static void myMethod()
    {
       savepoint sp = database.setSavepoint();
        try{
            integer i;
            i = i+10;
            
        }
        catch(DMLexception de)
        {
            system.debug(de.getMessage());
        }
        catch(nullPointerexception ne)
        {
            system.debug(ne.getMessage());
        }
        catch (queryexception qe)
        {
            system.debug(qe.getMessage());
        }
        catch (listexception le)
        {
             system.debug(le.getMessage());
        }
        catch (sObjectexception sq)
        {
            system.debug(sq.getMessage());
        }
        
    }
}