({
	wikiCallout : function(txtTosearch,component,helper) {
        alert('cl');
        var action=component.get("c.getWkisearch");
        var resLimit =component.get("v.resultLimit");
        action.setParams({
            
            searchKey:txtTosearch,
            SearchLimit:resLimit
        });
		
        action.setCallback(this,function(a){
            alert(a.getState);
           // if(a.getState === 'SUCCESS')
           // {
                helper.parseResult(a.getReturnValue(),helper);
           // }
        });
        $A.enqueueAction(action);
	},
	    parseResult : function(res,helper){
	     console.log(res);
           var retJSON = JSON.parse(res);
	       var jsonTitles = retJSON[1] ;
	        var jsonDetails = retJSON[2];
	        var jsonURL = retJSON[3];
	        alert('1'); 
	      var   domSearch = document.getElementById('resultPlaceHolder');
	        alert('2');
            while (domSearch.firstChild) {
	            domSearch.removeChild(domSearch.firstChild);
	        }
	         
	        for(var i=0; i<jsonTitles.length ; i++)
	        {
                alert('uday');
	          helper.createChildNodes(domSearch, jsonTitles[i],jsonDetails[i],jsonURL[i]);
	        }
	        
	    },
	     
	    createChildNodes : function(domSearch,title,desc,url){
            console.log(title);
	        var res_li = document.createElement('li');
	        res_li.setAttribute('class', 'slds-list__item');
	                 
	        var desc_span = document.createElement('span');
	        desc_span.innerText = ' '+desc ;
	        desc_span.setAttribute('class', 'slds-text-body--small'); 
	         
	         
	        var link = document.createElement('a');
	        link.setAttribute('href', url);
	        link.innerText = title ;
	         
	        res_li.appendChild(link);
	        res_li.appendChild(desc_span);
	        domSearch.appendChild(res_li);
	    }

})