<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="nome" value="${sessionScope.nome}"/>
<c:choose>
<c:when test="${not empty nome}">

<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Sistema de Controle de Endemias</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="vendors/switchery/switchery.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">	       
     
  </head>
  <c:choose>         
         <c:when test="${empty visita.latitude && empty visita.longitude}">
     		<body onload="getLocation()" class="nav-md">       
         </c:when>
         <c:otherwise>
            <body class="nav-md">
         </c:otherwise>
  </c:choose>
    <div class="container body">
      <div class="main_container">
  		<c:import url="menu.jsp" /> 
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
           <div class="row tile_count">
          </div>
          <!-- /top tiles -->

          <div class="row">             
          <br />		    
              <div class="row">			  
                <!-- Start to do list -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Visita</h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                   <form class="form-horizontal form-label-left" data-toggle="validator" method="post" action="visita">				 
                            <p>Atenção aos campos requeridos<code>*</code></p>
                                    <!-- <span class="section">Dados do Agente</span>-->					  
                           <!--IDbanco Input-->
                              <div class="form-group">
                                        <div class="col-md-2 col-xs-12">
                                            <input  type="hidden" readonly="readonly" type="text" id="idvisita" name="idvisita" value="${visita.idvisita}" class="form-control input-md">
                                        </div>
                              </div>
                          <!--Nome Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="agente">Agente <span class="required">*</span></label>
                                      <div class="col-lg-6 col-xs-12">
                                        <input type="text"   id="agente" readonly="readonly" name="agente" value="${visita.agente}" placeholder="ex: Joao da Silva" required="required" class="form-control input-md">                                        
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--data Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="data_visita">Data da visita <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="data_visita" name="data_visita" value="<fmt:formatDate value="${visita.data_visita}" pattern="dd/MM/yyyy HH:mm:ss"/>" required="required" class="form-control input-md">
                                         <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                        <!--Rua Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="rua">Rua <span class="required">*</span></label>
                                      <div class="col-lg-5 col-xs-12">
                                        <input type="text" id="rua" name="rua" value="${visita.rua}"required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--Quadra Lote Numero Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="quadra">Quadra <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="quadra" name="quadra" value="${visita.quadra} "required="required" class="form-control input-md">                                                                                
                                        <div class="help-block with-errors"></div>
                                      </div>
                                      <label class="control-label col-md-1" for="lote">Lote <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="lote" name="lote" value="${visita.lote}" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                      <label class="control-label col-md-1" for="numero">Nº <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="numero" name="numero" value="${visita.numero}" required="required" class="form-control input-md" 
                                        data-error="Preencha este campo">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>            
                            <!--Bairro Input-->                                										
									<div class="form-group">
									<label class="control-label col-md-3" for="bairro">Bairro
										<span class="required">*</span>
									</label>
									<div class="col-lg-3 col-xs-12">
										<select required id="bairro" name="bairro"
											title="Selecione item"
											class="form-control input-md selectpicker"
											data-live-search="true">
											 <c:if test = "${not empty visita.bairro}">											
                              					 	<option selected="selected">${visita.bairro}</option>
                            				 </c:if>										
											 <c:forEach var="combobairro" items="${listabairro}">      
				      							<option>${combobairro.nome_bairro}</option>      
											 </c:forEach> 											 
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
                        <!--Cidade select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="cidade">Cidade <span class="required">*</span></label>
                            <div class="col-lg-3 col-xs-12">
                            <select required id="cidade" name="cidade" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <c:if test = "${not empty visita.cidade}">											
                                <option selected="selected">${visita.cidade}</option>
                              </c:if>
                              <c:forEach var="combocidade" items="${listacidade}">      
						     	<option>${combocidade.nome_cidade}</option>      
							  </c:forEach> 
                            </select>
                             <div class="help-block with-errors"></div>
                            </div>
                          </div> 
                        <!--Coordenadas-->
                                                                       
                                      <div class="form-group">
                                      <label class="control-label col-md-3" for="coordenadas">Coordenadas <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="latitude"  name="latitude" value="${visita.latitude}" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                        <div class="help">Latitude</div>
                                      </div>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="longitude"  name="longitude" value="${visita.longitude}" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                        <div class="help">Longitude</div>
                                      </div>                                                          
                                    </div> 
	                               <!--  <c:if test="${not empty erro_localiza}">
	                               </c:if>-->
	                                 <div class="form-group">
                                    	<label class="control-label col-md-3"></label>
                                      	<div class="col-lg-4 col-xs-12">
                                        <p id="msgerro"></p>                                      				
										</div>      				    														
									</div>
										
						<!--Tipo_Imovel select-->                        
                          <div class="form-group">
                          <label class="control-label col-md-3" for="tipo">Tipo do Imovel <span class="required">*</span></label>
                            <div class="col-lg-3 col-xs-12">
                            <select required id="tp_imovel" name="tp_imovel"  title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <c:if test = "${not empty visita.tp_imovel}">											
                                <option selected="selected">${visita.tp_imovel}</option>
                              </c:if>                               
                              <c:forEach var="combotipoimovel" items="${listaimovel}">      
						     	<option>${combotipoimovel.nome_tpimovel}</option>      
							  </c:forEach>
                            </select>
                            <div class="help-block with-errors"></div>
                            </div>
                          </div>
                           <!--Switcher
                   				 	 <div class="form-group">
                     				 	 <label class="control-label col-md-3"> Foco de Infestação                           					
                        				 </label>
                        				 <div class="col-lg-3 col-xs-12">
                        					  <input type="checkbox" class="js-switch" /> 
                        				  </div>
                       				 </div>
                         		     <div class="ln_solid"></div>-->                                    
                        <!--Estagio select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="estagio">Estagio do Ciclo </label>
                            <div class="col-lg-3 col-xs-12">
                            <select multiple data-size="5" data-actions-box="false" id="estagio" name="estagio" title="Selecione item(s)" class="form-control input-md selectpicker" data-live-search="true">
                              <c:if test = "${not empty visita.estagio}">											
                              	<option selected>${visita.estagio}</option>
    		    			  </c:if>	
                              <c:forEach var="comboestagio" items="${listaestagio}">      
						     	<option>${comboestagio.nome_estagio}</option>      
							  </c:forEach>							  
                            </select>
                            </div>
                          </div>	
                          <!--Tratamento select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="tp_larvicida">Tratamento Local </label>
                            <div class="col-lg-3 col-xs-12">
                            <select multiple data-size="5"  id="tp_larvicida" name="tp_larvicida" title="Selecione item(s)" class="form-control input-md selectpicker" data-live-search="true">
                              <c:if test = "${not empty visita.tp_larvicida}">											
                                <option selected="selected">${visita.tp_larvicida}</option>
                              </c:if>
                              <c:forEach var="combotratamento" items="${listatratamento}">      
						     	<option>${combotratamento.nome_tratamento}</option>      
							  </c:forEach>
                            </select>
                            </div>
                          </div>
                          <!--Ação Recomendada select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="ac_corretiva">Ação Corretiva Recomendada </label>
                            <div class="col-lg-3 col-xs-12">
                            <select multiple data-size="5" id="ac_corretiva" name="ac_corretiva" title="Selecione item(s)" class="form-control input-md selectpicker" data-live-search="true">            
                              <c:if test = "${not empty visita.ac_corretiva}">											
                                <option selected="selected">${visita.ac_corretiva}</option>
                              </c:if>
                               <c:forEach var="combocorretiva" items="${listacorretiva}">      
						     	<option>${combocorretiva.nome_ac_corretiva}</option>      
							  </c:forEach>
                            </select>
                            </div>
                          </div>						  
                          <!--Local input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="local_foco">Local do Foco </label>
                                      <div class="col-lg-6 col-xs-12">
                                        <input type="text" id="local_foco" name="local_foco" value="${visita.local_foco}" placeholder="ex: caixa d'agua,vaso sanitário" class="form-control input-md">
                                      </div>
                                    </div>				 
                        <!--Botões-->    
                            <div class="ln_solid"></div>
                            <div class="form-group">
                              <div class="col-md-6 col-md-offset-3">
                                <!-- <button id="send" type="submit" class="btn btn-info" data-toggle="modal" data-target="#confirma">Gravar</button> -->
                                <button id="send" type="submit" class="btn btn-info">Gravar</button>
                                <button type="reset" class="btn btn-warning">Limpar</button>                             
                                      </div>
                                    </div>
                      </form>
                    </div>
                  </div>
                </div>  
              </div>
		</div>
		       </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap select -->
    <script src="js/bootstrap-select.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>
    <!-- Switchery -->
    <script src="vendors/switchery/switchery.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $('input[name="data_visita"]').daterangepicker({
            singleDatePicker: true,
            timePicker: true,
            timePickerIncrement: 1,
            showMeridian:false,
            timePicker24Hour:true,
            locale: {
                format: 'DD/MM/YYYY HH:mm'
            }
        });
    });
    </script>
    
    <script>
		var lat = document.getElementById("latitude");
		var log = document.getElementById("longitude");
		var exibe_erro = document.getElementById("msgerro");

		
		function getLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(capturaPosicao,mostraErro);		        
		    }
		}
		
		function capturaPosicao(position) {
		    lat.value = position.coords.latitude;
		    log.value = position.coords.longitude;
		    //log.innerHTML = position.coords.longitude;
		}

		function mostraErro(error) {
		    switch(error.code) {
		        case error.PERMISSION_DENIED:
		        	exibe_erro.innerHTML = "Usuário negou requisição para Geolocalização. Recarregue a página."
		            break;
		        case error.POSITION_UNAVAILABLE:
		        	exibe_erro.innerHTML = "Informação da localizaão está indisponivel."
		            break;
		        case error.TIMEOUT:
		        	exibe_erro.innerHTML = "Requisição para capturar posição excedeu tempo limite."
		            break;
		        case error.UNKNOWN_ERROR:
		        	exibe_erro.innerHTML = "Requisição de Geolocalização gerou erro desconhecido."
		            break;
		    }
		}
	</script>
    
    		<c:import url="rodape.jsp" />
  </body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>