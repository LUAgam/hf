$(function(){
	
				var currentpage = 1;
				var pagesize = 5;
				console.log(currentpage);
				console.log(pagesize);
				var datatemp;
				$.ajax({
					type: 'post',
					url: '../ptjob/getpage',
					data: {
						"currentpage" : currentpage,
						"pagesize": pagesize,
						
					},
					success: function(data) {
						/*var currentpage;
						var pagesize;*/
						datatemp = data.list;
						$('#pageToolbar').Paging({
							pagesize: pagesize,
							count: data.totalrecord,
							toolbar: true,
						callback: function(page, size, count) {
							console.log(arguments)
							currentpage = page;
							pagesize = size;
							
							//-----------------------------------------------------------------------
							if((currentpage != 1) || (pagesize != 5) ){
								var children = $("#table01").find("tr");
								for (var i = 1; i < children.length; i++) {
									children[i].remove();
								}
								$.ajax({
									type: 'post',
									url: '../fccfwss/pageQuery',
									data: {
										"currentpage" : currentpage,
										"pagesize": pagesize
									},
									success: function(data) {
										totalrecord = data.totalrecord;
										/*var temp = eval("("+data+")");*/
										var data1 = data.list;
										for(var i=0;i<data1.length;i++){
											$("#table01").append(
											"<tr><td>" + (i+1) + "</td><td>" + datatemp[i].name + 
											"</td><td>" + datatemp[i].age + 
											"</td><td>" + datatemp[i].sex + 
											"</td><td>" + datatemp[i].school + 
											"</td><td>" + datatemp[i].applytime + 
											"</td><td><button type='button' class='btn btn-info' onclick='getresume();'>查看简历"+
												"<span class='glyphicon glyphicon-search'></span>"+
											"</button>" +
													"</td></tr>");
										}
									},
								});
							}else{
								//-------------------------------------------------------
								var children = $("#table01").find("tr");
								for (var i = 1; i < children.length; i++) {
									children[i].remove();
								}
								
								for(var i=0;i<datatemp.length;i++){
									$("#table01").append(
											"<tr><td>" + (i+1) + "</td><td>" + datatemp[i].name + 
											"</td><td>" + datatemp[i].age + 
											"</td><td>" + datatemp[i].sex + 
											"</td><td>" + datatemp[i].school + 
											"</td><td>" + datatemp[i].applytime + 
											"</td><td><button type='button' class='btn btn-info' onclick='getresume();'>查看简历"+
												"<span class='glyphicon glyphicon-search'></span>"+
											"</button>" +
													"</td></tr>");
								}
								
							}
						}
					}),
						totalrecord = data.totalrecord;
						/*var temp = eval("("+data+")");*/
						var data1 = data.list;
						for(var i=0;i<data1.length;i++){
							$("#table01").append(
									"<tr><td>" + (i+1) + "</td><td>" + datatemp[i].name + 
											"</td><td>" + datatemp[i].age + 
											"</td><td>" + datatemp[i].sex + 
											"</td><td>" + datatemp[i].school + 
											"</td><td>" + datatemp[i].applytime + 
											"</td><td><button type='button' class='btn btn-info' onclick='getresume();'>查看简历"+
												"<span class='glyphicon glyphicon-search'></span>"+
											"</button>" +
													"</td></tr>");
						}
					},
				});
	
});
	
	
