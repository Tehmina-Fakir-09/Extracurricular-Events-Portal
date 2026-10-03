using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_EventDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Bind DataList
        if (!IsPostBack)
        {
            DataList1.DataBind(); 
        }
        
        
        
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblClosed = (Label)e.Item.FindControl("lblClosed");
            Button btnRegister = (Button)e.Item.FindControl("btnRegister");

            string status = DataBinder.Eval(e.Item.DataItem, "Status").ToString();

            if (status == "Closed")
            {
                btnRegister.Visible = false;
                lblClosed.Visible = true;
            }
            else
            {
                btnRegister.Visible = true;
                lblClosed.Visible = false;
            }
        }
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Response.Redirect("~/User/UserLogin.aspx");
    }
}