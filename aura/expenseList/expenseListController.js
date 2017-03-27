({
    update: function(component, evt, helper) {
        alert('uday');
      var expense = component.get("v.expense");
      // Note that updateExpense matches the name attribute in <aura:registerEvent>
      var updateEvent = component.getEvent("updateExpense");
      updateEvent.setParams({ "expense": expense }).fire();
    }
})