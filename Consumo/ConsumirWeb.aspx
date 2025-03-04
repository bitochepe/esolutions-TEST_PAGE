<%@ Page Language="VB" AutoEventWireup="true" CodeFile="ConsumirWeb.aspx.vb" Inherits="ConsumirWeb" %>

<!DOCTYPE html>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cotizador</title>
    <style>
    /*body {
      font-family: Arial, sans-serif;
      margin: 20px;
      padding: 0;
    }*/

    .form-container {
      display:grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }
    .form-container2 {
      display:grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 20px;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }

    .group {
      display: flex;
      flex-direction: column;
      width: 250px
    }

    label {
      font-weight: bold;
      margin-bottom: 2px;
    }

    input, select, textarea {
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 2px;
    }

    .form-actions {
      grid-column: span 5;
      display: flex;
      justify-content: flex-end;
    }

    button {
      padding: 10px 20px;
      border: none;
      background-color: #007bff;
      color: #fff;
      font-size: 16px;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

  </style>
</head>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <div class="row group">
                        <label class="">Destino Credito</label>
                        <asp:DropDownList CssClass="cotizador" runat="server" ID="destinoCredito" AutoPostBack="true" onchange="">
                            <asp:ListItem>Compra de Vivienda</asp:ListItem>
                            <asp:ListItem>Consolidación de deudas</asp:ListItem>
                            <asp:ListItem>Mixto</asp:ListItem>
                            <asp:ListItem>FHA</asp:ListItem>
                            <asp:ListItem>Compra de terreno</asp:ListItem>
                            <asp:ListItem>Construcción</asp:ListItem>
                            <asp:ListItem>Remodelación</asp:ListItem>
                            <asp:ListItem>LIP FHA</asp:ListItem>
                            <asp:ListItem>LIP DIRECTO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="row group">
                        <label class="">Monto Solicitado</label>
                        <asp:TextBox CssClass="cotizador" TextMode="Number" ID="montoSolicitado" runat="server"></asp:TextBox>
                    </div>
                    <div class="row group">
                        <label class="">Tipo Garantia</label>
                        <asp:DropDownList CssClass="cotizador" runat="server" ID="tipoGarantia">
                            <asp:ListItem>Nueva</asp:ListItem>
                            <asp:ListItem>Usada</asp:ListItem>
                            <asp:ListItem>Terreno</asp:ListItem>
                            <asp:ListItem>LIP FHA</asp:ListItem>
                            <asp:ListItem>LIP DIRECTO</asp:ListItem>
                        </asp:DropDownList></div>
                    <div class="row">
                    </div>
                </div>
                <div class="col-10">
                    <div class="form-container2" runat="server" style="border: 3px double #0056b3;">
                        <div class="form-group">
                            <label>RCI:</label>
                            <asp:TextBox ID="rci" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>RDG:</label>
                            <asp:TextBox ID="rdg" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Total de cuotas directas</label>
                            <asp:TextBox ID="totalCuotasDirectas" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>No. de cuota</label>
                            <asp:TextBox ID="noCuota" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Valor Diferente</label>
                            <asp:TextBox ID="valorDif" runat="server" disabled="true"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="valorDifSub" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>RCI Diferente</label>
                            <asp:TextBox ID="rciDif" runat="server" disabled="true"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="rciDifSub" runat="server" disabled="true"></asp:TextBox>
                        </div>
                        <div style="grid-column-start: span 3; padding: 10px" >
                            <asp:label ID="detalle" runat="server" disabled="true"></asp:label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Actividad Economica</label>
                    <asp:DropDownList CssClass="cotizador" runat="server" ID="actividad">
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="ingresoConstancia"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3"><label class="">Activida Economica 2</label>
                    <asp:DropDownList CssClass="cotizador" runat="server" ID="actividad2">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="ingresoConstancia2"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Descuento Constancia</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="descuentoConstancia"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Auxilio Postumo</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="auxilioPostumo"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Montepio</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="montepio"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Seguro</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="seguro"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 1</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda1">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 1</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda1"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 1</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda1"></asp:TextBox>
                </div>
                <div class="col-3">
                    <button style="margin-top:10px" Class="btn btn-primary" runat="server" id="btnArchivos" OnClick="cargarListaArchivos(); return false;">Archivos</button>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 2</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda2">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 2</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda2"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 2</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda2"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 3</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda3">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 3</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda3"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 3</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda3"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 4</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda4">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 4</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda4"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 4</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda4"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 5</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda5">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 5</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda5"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 5</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda5"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <label class="">Tipo Deuda 6</label>
                    <asp:DropDownList runat="server" CssClass="cotizador" ID="tipoDeuda6">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                        <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                        <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                        <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                        <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                        <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                        <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Saldo de Deuda 6</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="saldoDeuda6"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Cuota Deuda 6</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="cuotaDeuda6"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                <label class="">Estado cuenta Mes 1</label>
                <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="mes1"></asp:TextBox>

                </div>
                <div class="col-3">
                <label class="">Estado cuenta Mes 2</label>
                <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="mes2"></asp:TextBox>

                </div>
                <div class="col-3">
                <label class="">Estado cuenta Mes 3</label>
                <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="mes3"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-3">
                <label class="">Terreno Garantia</label>
                <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="terreno"></asp:TextBox>

                </div>
                <div class="col-3">
                <label class="">Score Predictivo</label>
                <asp:TextBox TextMode="Number" runat="server" ID="scorePredictivo"></asp:TextBox>

                </div>
            </div>
            <div class="row">
                <div class="col-3">
                <label class="">Construcciones Garantia</label>
                    <asp:TextBox TextMode="Number" CssClass="cotizador" runat="server" ID="construccion"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label class="">Clasificacion SIB</label>
                    <asp:DropDownList runat="server" ID="clasificacionSIB">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                        <asp:ListItem>E</asp:ListItem>
                        <asp:ListItem>S/C</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3">
                    <label class="">Conteo CCR</label>
                    <asp:DropDownList runat="server" ID="conteoCCR">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>mas de 6</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <asp:Button CssClass="cotizador" runat="server" ID="btnCotizador" Text="COTIZAR" OnClick="btnCotizador_Click" style="display:none;" />
            </div>
        </div>
        <br />
        
        <div class="modal fade" id="modalArchivo" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">Archivos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="row mt-4">
                        <h2>Lista de Archivos</h2>
                        <ul id="listaArchivos" class="list-group"></ul>
                    </div>
                    <div class="row">
                        <textarea id="contenidoArchivo" class="form-control" rows="10"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="guardarArchivo">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="modalAdvertencia" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitulo">Cotizador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="modalMensaje"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>

    <script>

        $(document).ready(function () {

        });

        var dropdowns = document.querySelectorAll(".cotizador");
        var btn = document.getElementById("btnCotizador");

        dropdowns.forEach(function (ddl) {
            ddl.addEventListener("change", function () {
                if (validarId("montoSolicitado") || validarId("ingresoConstancia"))
                    return Alerta("Faltante de Informacion: Monto Solicitado o Actividad Economica")

                if ($("#actividad2").val() != "")
                    if (validarId("ingresoConstancia2"))
                        return Alerta("Faltante de Informacion: Actividad Economica 2")
                if ($("#ingresoConstancia2").val() != "")
                    if (validarId("actividad2"))
                        return Alerta("Faltante de Informacion: Actividad Economica 2")

                if ($("#tipoDeuda1").val() != "")
                    if (validarId("saldoDeuda1"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda1").val() != "")
                    if (validarId("tipoDeuda1"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")

                if ($("#tipoDeuda2").val() != "")
                    if (validarId("saldoDeuda2"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda2").val() != "")
                    if (validarId("tipoDeuda2"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")

                if ($("#tipoDeuda3").val() != "")
                    if (validarId("saldoDeuda3"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda3").val() != "")
                    if (validarId("tipoDeuda3"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")

                if ($("#tipoDeuda4").val() != "")
                    if (validarId("saldoDeuda4"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda4").val() != "")
                    if (validarId("tipoDeuda4"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")

                if ($("#tipoDeuda5").val() != "")
                    if (validarId("saldoDeuda5"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda5").val() != "")
                    if (validarId("tipoDeuda5"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")

                if ($("#tipoDeuda6").val() != "")
                    if (validarId("saldoDeuda6"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")
                if ($("#saldoDeuda6").val() != "")
                    if (validarId("tipoDeuda6"))
                        return Alerta("Faltante de Informacion: Tipo Deuda o Saldo Deuda")


                btn.click();

            });
        });

        function cargarListaArchivos() {
            $("#contenidoArchivo").val("")
            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/ObtenerListaArchivos",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    
                    $("#listaArchivos").empty();
                    response.d.forEach(archivo => {
                        
                        $("#listaArchivos").append(`<li class="list-group-item archivo-item" data-nombre="${archivo}">${archivo}</li>`);
                    });
                    $("#modalArchivo").modal("show");
                }
            });
        }

        $(document).on("click", ".archivo-item", function () {
            let nombreArchivo = $(this).data("nombre");

            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/ObtenerContenidoArchivo",
                data: JSON.stringify({ strNombreArchivo: nombreArchivo }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#contenidoArchivo").val(response.d);
                    $("#guardarArchivo").data("nombre", nombreArchivo);
                    $("#modalArchivo").modal("show");
                }
            });
            return false;
        });

        $("#guardarArchivo").click(function () {
            let strNombreArchivo = $(this).data("nombre");
            let strNuevoContenido = $("#contenidoArchivo").val();

            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/GuardarArchivo",
                data: JSON.stringify({ strNombreArchivo: strNombreArchivo, strNuevoContenido: strNuevoContenido }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Item1 == 1) {
                        $("#modalArchivo").modal("hide");
                    }
                    alert(response.d.Item2)
                }
            });
        });


        function validarId(id) {
            if ($("#"+id).val() != "")
                return false
            return true
        }

        function Alerta(mensaje) {
            $("#modalMensaje").text(mensaje);
            $("#modalAdvertencia").modal("show");
        }


    </script>

</html>
