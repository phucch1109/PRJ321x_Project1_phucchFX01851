/*!
    * Start Bootstrap - SB Admin v7.0.2 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2021 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {
    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }
});
const searchParams = new URLSearchParams(window.location.search)
/*press enter on search input text-box to search method*/
$('#searchInput').keydown(function(e) {
			if (e.keyCode == 13) {
				var query = $('#searchInput').val();
				if(searchParams.has('id')) {
						var id =  searchParams.get('id');
						window.location.href = window.location.pathname + "?query=" + query+"&id=" + id;
						}
						else
				window.location.href = window.location.pathname + "?query=" + query;
			}
		});

/*select entries per page to change*/
		$('#accountInPage').on(
				'change',
				function() {
					var query = $('#searchInput').val();
					var number = $('#accountInPage').find(":selected").val();
					if(searchParams.has('id')) {
						var id =  searchParams.get('id');
						window.location.href = window.location.pathname + "?query=" + query
							+ "&numberShown=" + number+ "&id="+id;
					}else
					window.location.href = window.location.pathname + "?query=" + query
							+ "&numberShown=" + number;
				});
/*retain selected entries per page after click*/
		$(document).ready(
				function() {
					
					if(!searchParams.has('numberShown') ) {
						$("#accountInPage").val(5).attr('selected',
							'selected');
					}else {
						let numberShown = searchParams.get('numberShown');
					$("#accountInPage").val(numberShown).attr('selected',
							'selected');
					}
					
				});
/*show alert message*/
if(searchParams.has('alertMessage')) {
			var alertMes =  searchParams.get('alertMessage');
			 alert (alertMes);  
		} 
		
/*Controller for update button*/
		$('.updateBtn').click(function() {
			//alert("Sadddd");
			var idBtn = $(this).attr('id');
			var id = idBtn.substring(13);
			$('#exampleModalUpdate' + id).toggleClass('show');
			$('#exampleModalUpdate' + id).css("display", "block");

		});

		/*close icon event*/
		$('.btn-close').click(function() {
			var idBtn = $(this).attr('id');
			var id = idBtn.substring(9);
			$('#exampleModalUpdate' + id).toggleClass('show');
			$('#exampleModalUpdate' + id).css("display", "none");
		});
		/*đóng button event*/
		$('.btn-secondary').click(function() {
			var idBtn = $(this).attr('id');
			var id = idBtn.substring(12);
			$('#exampleModalUpdate' + id).toggleClass('show');
			$('#exampleModalUpdate' + id).css("display", "none");
		});