public class myTriggers 
{
	// type of triggers
	// 1* Before
	// 2* After
	
	// ------------Trigger events-------------
	// before inssert			after insert
	// befor update				after update
	// before delete			after delete
	// 							after undelete

	// Trigger Context Variables							
	// Trigger.New		Trigger.NewMap
	// Trigger.Old		Trigger.OldMap
	
	// Other Context Variables
	// isInsert
	// isUpdate
	// isDelete
	// isUndelete
	// isBefore
	// isAfter
	// size
	
	// Syntax	trigger myFirstTrigger on Account (before insert) 

}