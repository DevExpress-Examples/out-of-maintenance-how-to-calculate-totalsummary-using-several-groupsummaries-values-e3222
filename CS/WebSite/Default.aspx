<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsProducts"
				KeyFieldName="ProductID" OnCustomSummaryCalculate="grid_CustomSummaryCalculate">
				<Columns>
					<dx:GridViewCommandColumn VisibleIndex="0">
					</dx:GridViewCommandColumn>
					<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
						<EditFormSettings Visible="False" />
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataComboBoxColumn FieldName="CategoryID" GroupIndex="0" SortIndex="0"
						SortOrder="Ascending" VisibleIndex="2">
						<PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryID"
							ValueType="System.Int32">
						</PropertiesComboBox>
					</dx:GridViewDataComboBoxColumn>
					<dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="3">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6">
					</dx:GridViewDataTextColumn>
				</Columns>
				<GroupSummary>
					<dx:ASPxSummaryItem FieldName="UnitsInStock" ShowInGroupFooterColumn="Units In Stock"
						SummaryType="Sum" />
					<dx:ASPxSummaryItem FieldName="UnitsOnOrder" ShowInGroupFooterColumn="Units On Order"
						SummaryType="Sum" />
				</GroupSummary>
				<TotalSummary>
					<dx:ASPxSummaryItem SummaryType="Custom" FieldName="UnitsRemainded" ShowInColumn="Units In Stock"
						DisplayFormat="The remained quantity of units: {0}" />
				</TotalSummary>
				<Settings ShowFooter="True" ShowGroupFooter="VisibleAlways" />
			</dx:ASPxGridView>
			<asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
				SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Alphabetical list of products]">
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
				SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
		</div>
	</form>
</body>
</html>
