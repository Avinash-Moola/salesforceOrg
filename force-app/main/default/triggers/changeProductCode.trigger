trigger changeProductCode on Product2 (before insert) 
{
    list<product2> productlist=trigger.new;
    for (product2 p:productlist)
    {
        if(p.ProductCode!=null && p.ProductCode!='')
            {
                p.ProductCode='XYZ-'+p.ProductCode;
            }
    }
}