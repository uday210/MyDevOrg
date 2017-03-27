({
doInit: function(component) {
var device = $A.get("$Browser.formFactor");
alert("You are using a " + device);
}
})