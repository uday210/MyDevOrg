<aura:application >
    <aura:attribute name="myval" type="string" default="this is uday"/>	
    
    {!v.myval}
    
    
    <ui:inputText value="{!v.myval}"/>
</aura:application>