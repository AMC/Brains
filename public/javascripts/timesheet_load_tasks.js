$(function(){
    $("#project").change(function() {
        loadTasks(this.value)    
    });

	function loadTasks(projectId) {
		$.get("/projects/"+projectId+"/tasks", null,null,"script") }
	loadTasks($("#project").attr("value"));
})
