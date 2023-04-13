trigger DescriptionUpdate on Account (Before Insert) {
for (Account Account:Trigger.new)
{
    Account.Description='Account created by Description update trigger';
}
}