trigger beforeInsertEx on Account (before insert) 
{
    account a = trigger.new[0];
    a.site ='Site from Trigger';
}