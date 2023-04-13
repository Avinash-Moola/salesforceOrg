trigger DescriptionUpdate2 on Account (before update) {
for (Account Acc:trigger.new)
{
    Acc.Description='Description updated by second trigger example by '+userinfo.getName();
}
}