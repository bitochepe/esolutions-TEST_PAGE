Imports System.IO
Imports System.Net.Http
Imports System.Threading.Tasks
Imports System.Xml

Partial Class ConsumirWeb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

        Catch ex As Exception

        End Try
    End Sub

    Public Function ConsumirServicio() As Task
        Dim client As New HttpClient()
        Dim url As String = "http://cotizador.precalificador.desa/Cotizador/PrecalificacionCreditos.asmx/ObtenerDatos"

        Try
            client.Timeout = TimeSpan.FromSeconds(30)

            url += "?dcmMontoSolicitado=" + montoSolicitado.Text + "&strDestinoCredito=" + destinoCredito.Text + "&strTipoGarantia=" + tipoGarantia.Text +
                    "&strActividadEconomica=" + actividad.Text + "&dcmIngresoConstancia=" + ingresoConstancia.Text + "&strActividadEconomica2=" + actividad2.Text +
                    "&strIngresoConstancia2=" + ingresoConstancia2.Text + "&strAuxilioPostumo=" + auxilioPostumo.Text + "&strMontepio=" + montepio.Text +
                    "&strSeguros=" + seguro.Text + "&strDescuentoConstancia=" + descuentoConstancia.Text +
                    "&strTipoDeuda1=" + tipoDeuda1.Text + "&strSaldoDeuda1=" + saldoDeuda1.Text + "&strCuotaDeuda1=" + cuotaDeuda1.Text +
                    "&strTipoDeuda2=" + tipoDeuda2.Text + "&strSaldoDeuda2=" + saldoDeuda2.Text + "&strCuotaDeuda2=" + cuotaDeuda2.Text +
                    "&strTipoDeuda3=" + tipoDeuda3.Text + "&strSaldoDeuda3=" + saldoDeuda3.Text + "&strCuotaDeuda3=" + cuotaDeuda3.Text +
                    "&strTipoDeuda4=" + tipoDeuda4.Text + "&strSaldoDeuda4=" + saldoDeuda4.Text + "&strCuotaDeuda4=" + cuotaDeuda4.Text +
                    "&strTipoDeuda5=" + tipoDeuda5.Text + "&strSaldoDeuda5=" + saldoDeuda5.Text + "&strCuotaDeuda5=" + cuotaDeuda5.Text +
                    "&strTipoDeuda6=" + tipoDeuda6.Text + "&strSaldoDeuda6=" + saldoDeuda6.Text + "&strCuotaDeuda6=" + cuotaDeuda6.Text +
                    "&strMes1=" + mes1.Text + "&strMes2=" + mes2.Text + "&strMes3=" + mes3.Text + "&strTerreno=" + terreno.Text + "&strConstrucciones=" + construccion.Text +
                    "&strScorePredictivo=" + scorePredictivo.Text + "&strClasificacionSIB=" + clasificacionSIB.Text + "&strConteoCCR=" + conteoCCR.Text + ""

            'Dim jsonData As String = JsonConvert.SerializeObject(datos)
            'Dim content As New StringContent(jsonData, Encoding.UTF8, "application/json")

            Dim response As HttpResponseMessage = client.GetAsync(url).Result

            If response.IsSuccessStatusCode Then
                Dim content As String = response.Content.ReadAsStringAsync().Result
                Dim xmlDoc As New XmlDocument()
                xmlDoc.LoadXml(content)

                Dim tasaInteres As String = xmlDoc.SelectSingleNode("//tasaInteres").InnerText
                Dim plazoMeses As String = xmlDoc.SelectSingleNode("//plazoMeses").InnerText
                noCuota.Text = xmlDoc.SelectSingleNode("//noCuota").InnerText
                rci.Text = xmlDoc.SelectSingleNode("//rci").InnerText
                Dim bonificacionAE As String = xmlDoc.SelectSingleNode("//bonificacionAE").InnerText
                Dim igssAE As String = xmlDoc.SelectSingleNode("//igssAE").InnerText
                Dim isrAE As String = xmlDoc.SelectSingleNode("//isrAE").InnerText
                Dim bonificacionAE2 As String = xmlDoc.SelectSingleNode("//bonificacionAE2").InnerText
                Dim igssAE2 As String = xmlDoc.SelectSingleNode("//igssAE2").InnerText
                Dim isrAE2 As String = xmlDoc.SelectSingleNode("//isrAE2").InnerText
                Dim cuota As String = xmlDoc.SelectSingleNode("//cuota").InnerText
                totalCuotasDirectas.Text = xmlDoc.SelectSingleNode("//totalCuentasDirectas").InnerText
                Dim valorGarantiaHipotecaria As String = xmlDoc.SelectSingleNode("//valorGarantiaHipotecaria").InnerText
                rdg.Text = xmlDoc.SelectSingleNode("//rdg").InnerText
                Dim valores As String = xmlDoc.SelectSingleNode("//valorDiferente").InnerText
                Dim rcis As String = xmlDoc.SelectSingleNode("//rciDiferente").InnerText
                Dim trfLip As String = xmlDoc.SelectSingleNode("//trfLip").InnerText
                detalle.Text = xmlDoc.SelectSingleNode("//detalle").InnerText

                If Not String.IsNullOrEmpty(valores) Then
                    valorDif.Text = valores.Split("|"c)(0)
                    valorDifSub.Text = valores.Split("|"c)(1)
                End If
                If Not String.IsNullOrEmpty(rcis) Then
                    rciDif.Text = rcis.Split("|"c)(0)
                    rciDifSub.Text = rcis.Split("|"c)(1)
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
