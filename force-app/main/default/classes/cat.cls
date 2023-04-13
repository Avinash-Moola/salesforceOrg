public class cat 
{
	private string name;
    private integer age;
    
    public cat(string n, integer a)
    {
        name =n;
        age=a;
        system.debug('Cat Name is :'+name+' age is '+age);
    }
    
    public cat()
    {
        name ='avi';
        age=10;
        system.debug('Cat Name is :'+name+' age is '+age);
    }
    
        public void display()
        {
            system.debug('Cat Name is :'+name+' age is '+age);
        }
    
    public  void setCat(string n,integer a)
    {
        name=n;
        if(a<=0)
        {
            system.debug('Cat age should not be less than 0');
        }
        else
        {
            age=a;
        }
        system.debug('Your cat name is '+name+' and its age is '+age);
    }
    public static void av()
    {
        system.debug('Static method');
    }
    

}