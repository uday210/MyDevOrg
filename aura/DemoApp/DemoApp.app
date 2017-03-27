<aura:application access="GLOBAL" extends="ltng:outApp">
  <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    <c:NewComponent />
    <c:facetHeader />
    <c:BrowserTest />
  
    <ui:menu >
    <ui:menuTriggerLink aura:id="trigger" label="Opportunity Status"/>
        <ui:menuList class="actionMenu" aura:id="actionMenu">
              <ui:actionMenuItem aura:id="item2" label="Open" click="{!c.updateTriggerLabel}"/>
              <ui:actionMenuItem aura:id="item3" label="Closed" click="{!c.updateTriggerLabel}"/>
              <ui:actionMenuItem aura:id="item4" label="Closed Won" click="{!c.updateTriggerLabel}"/>
        </ui:menuList>
</ui:menu>
     <c:MenuComp />
	
</aura:application>