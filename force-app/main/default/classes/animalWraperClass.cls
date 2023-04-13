public class animalWraperClass 
{
	public List<String> animals;

	
	public static animalWraperClass parse(String json) {
		return (animalWraperClass) System.JSON.deserialize(json, animalWraperClass.class);
	}
}