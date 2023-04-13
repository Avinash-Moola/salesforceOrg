public class fahrenheitToCelsius 
{
	public static decimal conversionMethod(decimal fh)
    {
        decimal celsius = (fh-32)*5/9;
        system.debug(fh+' Fahrenheit is equal to '+celsius.setscale(2)+' Celsius');
        return celsius.setscale(2);
    }
}