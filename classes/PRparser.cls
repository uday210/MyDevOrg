public class PRparser {

        public PRparser(){}

    public String First_Name{get;set;}
    public String Email{get;set;}

    
    public static PRparser parse(String json) {
        return (PRparser) System.JSON.deserialize(json, PRparser.class);
    }
}