<aura:application >
    <ltng:require styles='/resource/bootstrap/bootstrap/dist/css/bootstrap.min.css'/>
    <div class='col-md-4' style="height:400px;overflow:scroll;padding-top:10px;">
        <c:AccountList />
    </div>
     <div class='col-md-4' style="height:400px;overflow:scroll;padding-top:10px;">
        <c:CreateTask />
    </div>
    
     <div class='col-md-4' style="height:400px;overflow:scroll;padding-top:10px;">
        <c:ReportView />
    </div>
    
	
</aura:application>