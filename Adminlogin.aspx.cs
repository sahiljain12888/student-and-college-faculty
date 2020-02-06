using Check;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminlogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtemail.Text != "" && txtpass.Text != "")
        {
            string k = "SELECT * FROM Admin where Username='" + txtemail.Text + "' and Pass='" + txtpass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(k, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                Session["User"] = "Admin";
                Response.Redirect("Managecourse.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Invalid  Email or Password')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Enter Email and Password')", true);
        }
    }
}