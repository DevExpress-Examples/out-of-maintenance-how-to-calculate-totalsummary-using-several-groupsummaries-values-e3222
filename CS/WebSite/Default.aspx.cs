using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Data;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
	private readonly List<int> groupRowIndexes = new List<int>();
	protected void Page_Load(object sender, EventArgs e) {

	}

	protected void grid_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e) {
		if (!e.IsTotalSummary)
			return;

		ASPxGridView g = sender as ASPxGridView;
		if ((e.SummaryProcess == CustomSummaryProcess.Finalize)) {
			decimal totalValue = 0;
			CollectGorups();
			foreach (int groupRowIndex in groupRowIndexes) {
				decimal uisCount = (decimal)g.GetGroupSummaryValue(groupRowIndex, grid.GroupSummary["UnitsInStock"]);
				decimal uioCount = (decimal)g.GetGroupSummaryValue(groupRowIndex, grid.GroupSummary["UnitsOnOrder"]);
				totalValue += uisCount - uioCount;
			}
			e.TotalValue = totalValue;
		}
	}
	private void CollectGorups(){
		for (int i = grid.VisibleStartIndex; i < grid.VisibleRowCount; ++i)
			if (grid.IsGroupRow(i))
				groupRowIndexes.Add(i);
	}
	
}