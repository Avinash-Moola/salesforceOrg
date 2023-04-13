public class dynamicSOQL
{
	public static void dSOQL(string s, list<string> l1)
    {
        
        string qr = 'select ID';
        for (string f:l1)
        {
           qr += ', '+l1;
        }
        qr = qr + ' from ' + s;
        
        string qe = string.escapeSingleQuotes(qr);
        list<sobject> l2 = Database.query(qe);
    }
}