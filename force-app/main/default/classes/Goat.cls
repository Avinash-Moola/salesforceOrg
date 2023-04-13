public class Goat 
{
	private string name;
    private integer count;
    
    public Goat()
    {
        name ='Shaun';
        count=10;
    }
    
    public Goat(string n,integer c)
    {
        name=n;
        count=c;
    }
    public void Disp()
    {
        name = name.toUpperCase();
        system.debug('Name of the Goat is '+name+' '+'and number of goats are '+count+'avi');
    }
    
}