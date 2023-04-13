@istest
public class TestFahrenheitToCelsius 
{
	@isTest
    static void testPositiveValue()
    {
        decimal cs = fahrenheitToCelsius.conversionMethod(200);
        system.assertEquals(93.33, cs);
    }
    @isTest
    static void testNegitiveValue()
    {
        decimal cs = fahrenheitToCelsius.conversionMethod(-100);
        system.assertEquals(-73.33, cs);
    }
}