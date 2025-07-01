<%@ Page Language="VB" AutoEventWireup="true" CodeFile="ConsumirWeb.aspx.vb" Inherits="ConsumirWeb" %>

<!DOCTYPE html>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cotizador</title>
    <style>
    label {
      font-weight: bold;
      margin-bottom: 2px;
    }
    </style>
</head>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="border: 3px double #0056b3; padding: 20px; margin: 25px 0 0 0;">
                <div class="col-12 col-md-4 mb-3">
                    <label>RCI:</label>
                    <asp:TextBox ID="rci" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>RDG:</label>
                    <asp:TextBox ID="rdg" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>Total de cuotas directas</label>
                    <asp:TextBox ID="totalCuotasDirectas" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>Valor de cuota</label>
                    <asp:TextBox ID="noCuota" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>Valor Diferente</label>
                    <asp:TextBox ID="valorDif" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="valorDifSub" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>RCI Diferente</label>
                    <asp:TextBox ID="rciDif" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="rciDifSub" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 mt-3">
                    <asp:Label ID="detalle" runat="server" disabled="true" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="accordion mt-3" id="accordionDesgloseCuotas">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingDesglose">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDesglose" aria-expanded="false" aria-controls="collapseDesglose">
                      Desglose de cuotas
                    </button>
                  </h2>
                  <div id="collapseDesglose" class="accordion-collapse collapse" aria-labelledby="headingDesglose" data-bs-parent="#accordionDesgloseCuotas">
                    <div class="accordion-body">
                      <table class="table table-bordered">
                        <tbody>
                          <tr>
                            <td>Capital</td>
                            <td><asp:Label ID="lblCapital" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Intereses</td>
                            <td><asp:Label ID="lblIntereses" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuota sin seguros</td>
                            <td><asp:Label ID="lblCuotaSinSeguros" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Seguro de vida</td>
                            <td><asp:Label ID="lblSeguroVida" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Seguro de daños</td>
                            <td><asp:Label ID="lblSeguroDanios" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuota total</td>
                            <td><asp:Label ID="lblCuotaTotal" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Endeudamiento Interno</td>
                            <td><asp:Label ID="lblEndeudamientoInterno" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Endeudamiento Externo</td>
                            <td><asp:Label ID="lblEndeudamientoExterno" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuotas vigentes</td>
                            <td><asp:Label ID="lblCuotasVigentes" runat="server" /></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            <hr />
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Destino Crédito</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="destinoCredito" AutoPostBack="true">
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
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Monto Solicitado</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" ID="montoSolicitado" runat="server"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Antigüedad de Garantía</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="tipoGarantia">
                        <asp:ListItem>Nueva</asp:ListItem>
                        <asp:ListItem>Usada</asp:ListItem>
                        <asp:ListItem>Terreno</asp:ListItem>
                        <asp:ListItem>LIP FHA</asp:ListItem>
                        <asp:ListItem>LIP DIRECTO</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Tasa Interés %</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" ID="tasaInteres" runat="server" TextMode="Number" min="0" step="0.01"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Plazo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" ID="plazoMeses" runat="server" min="1"></asp:TextBox>
                    <asp:Label ID="lblPlazoAdvertencia" runat="server" CssClass="text-danger" Style="font-size: 12px;"></asp:Label>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Tipo de Cuota</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="tipoCuota">
                        <asp:ListItem Value="nivelada">Cuota Nivelada</asp:ListItem>
                        <asp:ListItem Value="saldos">Cuota sobre saldos</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                    <button style="margin-top:10px" Class="btn btn-primary" runat="server" id="btnArchivos" OnClick="cargarListaArchivos(); return false;">Editar tasas</button>
                </div>
            </div>
            <hr />
            <div class="row">
                <h3>Ingresos</h3>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Actividad Económica</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="actividad">
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" runat="server" ID="ingresoConstancia" min="0"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Bonificación</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" runat="server" ID="bonificacionActividadEconomica"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">IGGS</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="iggsActividadEconomica" min="0"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">ISR</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="isrActividadEconomica" min="0"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Comisiones</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="comisionesActividadEconomica"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Actividad Económica 2</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="actividad2">
                        <asp:ListItem></asp:ListItem>    
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" runat="server" ID="ingresoConstancia2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Bonificación</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" runat="server" ID="bonificacionActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">IGGS</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="iggsActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">ISR</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="isrActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Comisiones</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="comisionesActividadEconomica2"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row">
                <h3>Descuentos</h3>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Descuento Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="descuentoConstancia"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Auxilio Póstumo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="auxilioPostumo"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Montepio</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="montepio"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Seguro</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="seguro"></asp:TextBox>
                </div>
            </div>
            
            <hr />
            <div class="row">
                <h3>Deudas</h3>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 1</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda1">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda1"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta1"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda1"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 2</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda2">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda2"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta2"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda2"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 3</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda3">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda3"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta3"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda3"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 4</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda4">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda4"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta4"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda4"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 5</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda5">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda5"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta5"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 6</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda6">
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
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda6"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta6"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda6"></asp:TextBox>
                    </div>
                </div>  
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Estados de Cuenta</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 1</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes1"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 2</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 3</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes3"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Garantías</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 mb-3">
                    <label class="">Terreno Garantía</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="terreno"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 mb-3">
                    <label class="">Construcciones Garantía</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="construccion"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Clasificaciones y Score</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Score Predictivo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="scorePredictivo"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Clasificación SIB</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="clasificacionSIB">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                        <asp:ListItem>E</asp:ListItem>
                        <asp:ListItem>S/C</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Conteo CCR</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="conteoCCR">
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Archivos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row mt-4">
                            <h2>Lista de Archivos</h2>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Archivo</th>
                                            <th>Descripción</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="listaArchivos">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <textarea id="contenidoArchivo" class="form-control" rows="10" style="width: 100%;"></textarea>
                            </div>
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
            <div class="modal-dialog">
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

                if (ddl.id == "tipoGarantia") {
                    document.getElementById("plazoMeses").value = "";
                }

                

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
                        $("#listaArchivos").append(`
                            <tr>
                                <td>${archivo.Nombre}</td>
                                <td>${archivo.Descripcion}</td>
                                <td>
                                    <button class="btn btn-sm btn-primary archivo-item" data-nombre="${archivo.Nombre}">
                                        Editar
                                    </button>
                                </td>
                            </tr>
                        `);
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

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
        var txt = document.getElementById("scorePredictivo");
        if (txt) {
            txt.addEventListener("input", function () {
                var value = parseFloat(txt.value);
                if (!isNaN(value)) {
                    if (value >= 0 && value <= 565) {
                        txt.style.backgroundColor = "#ffcccc"; // Rojo claro
                    }
                    else if (value < 0) {
                        txt.style.backgroundColor = "#ffffcc"; // amarillo claro
                    }
                    else {
                        txt.style.backgroundColor = "#ccffcc"; // Verde claro
                    }
                } else {
                    txt.style.backgroundColor = ""; // Sin color
                }
            });
        }

        var sib = document.getElementById("clasificacionSIB");
        if (sib) {
            sib.addEventListener("change", function () {
                var valor = sib.value;
                if (valor === "") {
                    sib.style.backgroundColor = ""; // sin color
                } else if (valor === "A") {
                    sib.style.backgroundColor = "#ccffcc"; // rojo claro
                } else if (valor === "B") {
                    sib.style.backgroundColor = "#ffffcc"; // amarillo claro
                } else {
                    sib.style.backgroundColor = "#ffcccc"; // rojo claro
                }
            });
        }

        var ccr = document.getElementById("conteoCCR");
        if (ccr) {
            ccr.addEventListener("input", function () {
                if (ccr.value.trim() !== "") {
                    ccr.style.backgroundColor = "#ffcccc"; // rojo claro
                } else {
                    ccr.style.backgroundColor = ""; // sin color
                }
            });
        }
    });
    </script>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
      document.querySelectorAll('.solo-numeros').forEach(function(input) {
        input.addEventListener('input', function(e) {
          this.value = this.value.replace(/[^0-9.]/g, '');
          if ((this.value.match(/\./g) || []).length > 1) {
            this.value = this.value.substring(0, this.value.length - 1);
          }
        });
      });
    });
    </script>
</html>