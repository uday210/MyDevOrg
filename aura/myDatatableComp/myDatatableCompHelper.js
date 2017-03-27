({
	getData : function(cmp,noofrecords,myName) {
        cmp.set("v.dataexists", "true");
		    var data = [];
    for (var i = 0; i < noofrecords; i++) {
      data.push({
        Name: myName +' test '+i,
        City: myName +' test city '+i,
        Phone: '12345678'+i 
          
      });
    }
    cmp.set("v.wrapperClass", data);
	}
})