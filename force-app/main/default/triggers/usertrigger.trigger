trigger usertrigger on User (before insert,after insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        User u = Trigger.new[0];
        system.debug('Test: ****** '+u.Username);
    }
}