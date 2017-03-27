global class AccCon{




webservice static Account AllAccs(){



return [select id from Account limit 1];
}
}