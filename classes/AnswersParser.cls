public class AnswersParser {

    public String Question{get;set;}
    public String Answer{get;set;}
    public String Question_Type{get;set;}
    
    public AnswersParser(){}

    
    public static AnswersParser parse(String json) {
        return (AnswersParser) System.JSON.deserialize(json, AnswersParser.class);
    }
}