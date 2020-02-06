using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Changepass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Tid"] == null)
            {
                Response.Redirect("Tutorlogin.aspx");
            }
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string tid = Session["Tid"].ToString();
        if (TextBoxcpass.Text != "" && TextBoxcnpass.Text != "")
        {
            string selectcmd = "SELECT Pass FROM Tutor where Pass='" + TextBoxcpass.Text + "' and  Tid='" + tid + "'";
            SqlCommand cmd = new SqlCommand(selectcmd, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                string up = "update Tutor set Pass ='" + TextBoxcnpass.Text + "' where Tid='" + tid + "'";
                SqlCommand cmd1 = new SqlCommand(up, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Changepass.aspx");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Incorrect Current password')", true);
            }
            con.Close();
        }
    }
}