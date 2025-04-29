Imports System.IO
Imports System.Net
Imports System.Net.Http
Imports System.Security.Policy
Imports System.Threading.Tasks
Imports System.Web.Script.Serialization
Imports System.Xml

Partial Class ConsumirWeb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strMetodo As String
        Dim strRespuesta As String

        'Try

        'Catch ex As Exception

        'End Try
    End Sub

    Public Function ConsumirServicio() As Task
        Dim client As New HttpClient()
        'Dim url As String = "http://cotizador.esol.com/Cotizador/PrecalificacionCreditos.asmx/ObtenerDatos"
        Dim url As String = ConfigurationManager.AppSettings("webServiceUrl")

        Try
            client.Timeout = TimeSpan.FromSeconds(30)

            url += "?dcmMontoSolicitado=" + montoSolicitado.Text + "&strDestinoCredito=" + destinoCredito.Text + "&strTipoGarantia=" + tipoGarantia.Text +
                    "&strActividadEconomica=" + actividad.Text + "&dcmIngresoConstancia=" + ingresoConstancia.Text + "&strActividadEconomica2=" + actividad2.Text +
                    "&strIngresoConstancia2=" + ingresoConstancia2.Text + "&strAuxilioPostumo=" + auxilioPostumo.Text + "&strMontepio=" + montepio.Text +
                    "&strSeguros=" + seguro.Text + "&strDescuentoConstancia=" + descuentoConstancia.Text +
                    "&strTipoDeuda1=" + tipoDeuda1.Text + "&strSaldoDeuda1=" + saldoDeuda1.Text + "&strLimiteTarjeta1=" + limiteTarjeta1.Text + "&strCuotaDeuda1=" + cuotaDeuda1.Text +
                    "&strTipoDeuda2=" + tipoDeuda2.Text + "&strSaldoDeuda2=" + saldoDeuda2.Text + "&strLimiteTarjeta2=" + limiteTarjeta2.Text + "&strCuotaDeuda2=" + cuotaDeuda2.Text +
                    "&strTipoDeuda3=" + tipoDeuda3.Text + "&strSaldoDeuda3=" + saldoDeuda3.Text + "&strLimiteTarjeta3=" + limiteTarjeta3.Text + "&strCuotaDeuda3=" + cuotaDeuda3.Text +
                    "&strTipoDeuda4=" + tipoDeuda4.Text + "&strSaldoDeuda4=" + saldoDeuda4.Text + "&strLimiteTarjeta4=" + limiteTarjeta4.Text + "&strCuotaDeuda4=" + cuotaDeuda4.Text +
                    "&strTipoDeuda5=" + tipoDeuda5.Text + "&strSaldoDeuda5=" + saldoDeuda5.Text + "&strLimiteTarjeta5=" + limiteTarjeta5.Text + "&strCuotaDeuda5=" + cuotaDeuda5.Text +
                    "&strTipoDeuda6=" + tipoDeuda6.Text + "&strSaldoDeuda6=" + saldoDeuda6.Text + "&strLimiteTarjeta6=" + limiteTarjeta6.Text + "&strCuotaDeuda6=" + cuotaDeuda6.Text +
                    "&strMes1=" + mes1.Text + "&strMes2=" + mes2.Text + "&strMes3=" + mes3.Text + "&strTerreno=" + terreno.Text + "&strConstrucciones=" + construccion.Text +
                    "&strScorePredictivo=" + scorePredictivo.Text + "&strClasificacionSIB=" + clasificacionSIB.Text + "&strConteoCCR=" + conteoCCR.Text + "&strPlazoMeses=" + plazoMeses.Text +
                    "&strBonificacionActividadEconomica=" + bonificacionActividadEconomica.Text +
                    "&strIgssActividadEconomica=" + iggsActividadEconomica.Text +
                    "&strIsrActividadEconomica=" + isrActividadEconomica.Text +
                    "&strBonificacionActividadEconomica2=" + bonificacionActividadEconomica2.Text +
                    "&strIgssActividadEconomica2=" + iggsActividadEconomica2.Text +
                    "&strIsrActividadEconomica2=" + isrActividadEconomica2.Text +
                    "&strComisionesActividadEconomica=" + comisionesActividadEconomica.Text +
                    "&strComisionesActividadEconomica2=" + comisionesActividadEconomica2.Text

            Dim response As HttpResponseMessage = client.GetAsync(url).Result

            If response.IsSuccessStatusCode Then
                Dim content As String = response.Content.ReadAsStringAsync().Result
                Dim xmlDoc As New XmlDocument()
                xmlDoc.LoadXml(content)
                Dim plazoMesesEnviado As Decimal = 0
                If Not String.IsNullOrEmpty(plazoMeses.Text) Then
                    plazoMesesEnviado = Convert.ToDecimal(plazoMeses.Text)
                End If

                ' Dim tasaInteres As String = xmlDoc.SelectSingleNode("//tasaInteres").InnerText
                ' Dim plazoMeses As String = xmlDoc.SelectSingleNode("//plazoMeses").InnerText
                noCuota.Text = xmlDoc.SelectSingleNode("//noCuota").InnerText
                rci.Text = xmlDoc.SelectSingleNode("//rci").InnerText
                'Dim bonificacionActividadEconomica As String = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica").InnerText
                'Dim igssActividadEconomica As String = xmlDoc.SelectSingleNode("//igssActividadEconomica").InnerText
                'Dim isrActividadEconomica As String = xmlDoc.SelectSingleNode("//isrActividadEconomica").InnerText
                'Dim bonificacionActividadEconomica2 As String = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica2").InnerText
                'Dim igssActividadEconomica2 As String = xmlDoc.SelectSingleNode("//igssActividadEconomica2").InnerText
                'Dim isrActividadEconomica2 As String = xmlDoc.SelectSingleNode("//isrActividadEconomica2").InnerText
                Dim cuota As String = xmlDoc.SelectSingleNode("//cuota").InnerText
                totalCuotasDirectas.Text = xmlDoc.SelectSingleNode("//totalCuentasDirectas").InnerText
                Dim valorGarantiaHipotecaria As String = xmlDoc.SelectSingleNode("//valorGarantiaHipotecaria").InnerText
                rdg.Text = xmlDoc.SelectSingleNode("//rdg").InnerText
                Dim valores As String = xmlDoc.SelectSingleNode("//valorDiferente").InnerText
                Dim rcis As String = xmlDoc.SelectSingleNode("//rciDiferente").InnerText
                Dim trfLip As String = xmlDoc.SelectSingleNode("//trfLip").InnerText
                detalle.Text = xmlDoc.SelectSingleNode("//detalle").InnerText
                plazoMeses.Text = xmlDoc.SelectSingleNode("//plazoMeses").InnerText
                tasaInteres.Text = xmlDoc.SelectSingleNode("//tasaInteres").InnerText
                bonificacionActividadEconomica.Text = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica").InnerText
                isrActividadEconomica.Text = xmlDoc.SelectSingleNode("//isrActividadEconomica").InnerText
                iggsActividadEconomica.Text = xmlDoc.SelectSingleNode("//igssActividadEconomica").InnerText
                bonificacionActividadEconomica2.Text = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica2").InnerText
                isrActividadEconomica2.Text = xmlDoc.SelectSingleNode("//isrActividadEconomica2").InnerText
                iggsActividadEconomica2.Text = xmlDoc.SelectSingleNode("//igssActividadEconomica2").InnerText

                If Not String.IsNullOrEmpty(valores) Then
                    valorDif.Text = valores.Split("|"c)(0)
                    valorDifSub.Text = valores.Split("|"c)(1)
                End If
                If Not String.IsNullOrEmpty(rcis) Then
                    rciDif.Text = rcis.Split("|"c)(0)
                    rciDifSub.Text = rcis.Split("|"c)(1)
                End If


                If plazoMesesEnviado > 0 And plazoMesesEnviado > Convert.ToDecimal(plazoMeses.Text) Then
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowModal", "$('#modalAdvertencia').modal('show');", True)
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Cuota alta');", True)

                End If


            Else
                Console.WriteLine($"Error: {response.StatusCode} - {response.ReasonPhrase}")
            End If
        Catch ex As Exception
            Console.WriteLine("Error: " & ex.Message)
        End Try
    End Function

    Protected Sub btnCotizador_Click(sender As Object, e As EventArgs)
        ConsumirServicio()
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function ObtenerListaArchivos() As List(Of String)
        Dim strArchivos = New List(Of String)
        Dim strRuta As String

        strRuta = ConfigurationManager.AppSettings("pathArchivos")

        If Directory.Exists(strRuta) Then
            strArchivos = Directory.GetFiles(strRuta, "*.xml").Select(Function(f) Path.GetFileName(f)).ToList()
        End If

        Return strArchivos

    End Function


    <System.Web.Services.WebMethod()>
    Public Shared Function ObtenerContenidoArchivo(strNombreArchivo As String) As String
        Dim strRutaArchivo As String = Path.Combine(ConfigurationManager.AppSettings("pathArchivos"), strNombreArchivo)

        If File.Exists(strRutaArchivo) Then
            Return File.ReadAllText(strRutaArchivo)
        Else
            Return "Error: El archivo no existe"
        End If

    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Function GuardarArchivo(strNombreArchivo As String, strNuevoContenido As String) As (Integer, String)
        Dim strRutaArchivo As String = Path.Combine(ConfigurationManager.AppSettings("pathArchivos"), strNombreArchivo)

        Try
            Dim xmlDoc As New XmlDocument()
            xmlDoc.LoadXml(strNuevoContenido)

            File.WriteAllText(strRutaArchivo, strNuevoContenido)
            Return (1, "Archivo guardado correctamente.")
        Catch ex As Exception
            Return (0, "ERROR: El contenido no es un XML válido.")
        End Try
    End Function


    'Public Sub EscribirRegistro(strMensaje As String)
    '    Dim strRuta As String
    '    strRuta = Server.MapPath("~/Archivos/Prueba.txt")
    '    Try
    '        Using writer As StreamWriter = New StreamWriter(strRuta, True)
    '            writer.WriteLine($"{DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss")} - {strMensaje}")
    '        End Using
    '    Catch ex As Exception
    '        Console.WriteLine($"Error al escribir en el log: {ex.Message}")
    '    End Try

    'End Sub

End Class
