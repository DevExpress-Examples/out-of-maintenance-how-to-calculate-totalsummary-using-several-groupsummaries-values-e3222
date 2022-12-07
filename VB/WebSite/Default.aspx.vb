Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Data
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private ReadOnly groupRowIndexes As List(Of Integer) = New List(Of Integer)()
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub grid_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs)
		If (Not e.IsTotalSummary) Then
			Return
		End If

		Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
		If (e.SummaryProcess = CustomSummaryProcess.Finalize) Then
			Dim totalValue As Decimal = 0
			CollectGorups()
			For Each groupRowIndex As Integer In groupRowIndexes
				Dim uisCount As Decimal = CDec(g.GetGroupSummaryValue(groupRowIndex, grid.GroupSummary("UnitsInStock")))
				Dim uioCount As Decimal = CDec(g.GetGroupSummaryValue(groupRowIndex, grid.GroupSummary("UnitsOnOrder")))
				totalValue += uisCount - uioCount
			Next groupRowIndex
			e.TotalValue = totalValue
		End If
	End Sub
	Private Sub CollectGorups()
		For i As Integer = grid.VisibleStartIndex To grid.VisibleRowCount - 1
			If grid.IsGroupRow(i) Then
				groupRowIndexes.Add(i)
			End If
		Next i
	End Sub

End Class