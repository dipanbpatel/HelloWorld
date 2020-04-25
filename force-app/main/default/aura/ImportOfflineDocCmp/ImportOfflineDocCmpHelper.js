({
    updateStatus: function(component, event) {
        var uploadedFiles = event.getParam("files");
        var documentId = uploadedFiles[0].documentId;
        var action = component.get("c.processDocument");
        console.log('documentId: ' + documentId);
        action.setParams({
            agreementId: component.get("v.recordId"),
            documentId: documentId,
        });
        console.log('action: ' + action);
        action.setCallback(this, function(a) {
            var state = a.getState();
            console.log('state: ' + state);
            if (state === "SUCCESS") {
                callback(a.getReturnValue());
            }else if (state === "ERROR") {
                var errors = a.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
})