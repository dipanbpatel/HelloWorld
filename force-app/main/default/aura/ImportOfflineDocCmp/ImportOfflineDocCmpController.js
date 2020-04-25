({
    handleUploadFinished: function (component, event, helper) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        helper.updateStatus(component, event, helper);
        // show success message – with no of files uploaded
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
        	"title": "Success!",
	        "type" : "success",
    	    "message": uploadedFiles.length+" files has been updated successfully!"
        });
        toastEvent.fire();
        
        $A.get('e.force:refreshView').fire();
        
        // Close the action panel
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
    },
    
    doSave: function(component, event, helper) {
        if (component.get("v.fileToBeUploaded") != null) {
            //alert('in if');
            var file = component.get("v.fileToBeUploaded")[0][0];
            var reader = new FileReader();
            reader.onload = $A.getCallback(function() {
                var dataURL = reader.result;
                var content = dataURL.match(/,(.*)$/)[1];
                helper.upload(component, file, content, function(answer) {
                    alert('answer'+answer);                
                });
            });
            reader.readAsDataURL(file);
        } else {
            alert('Please Select a Valid File');
        }
    }
})