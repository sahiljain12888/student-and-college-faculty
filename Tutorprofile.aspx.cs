using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Tutorprofile : System.Web.UI.Page
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
            string tid = Session["Tid"].ToString();
            string selectcmd = "SELECT Name,Email,Contact FROM Tutor where Tid='" + tid + "'";
            SqlCommand cmd = new SqlCommand(selectcmd, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                txtname.Text = dr[0].ToString();
                txtemail.Text = dr[1].ToString();
                txtcon.Text = dr[2].ToString();
                lblname.Text = dr[0].ToString();
                lblemail.Text = dr[1].ToString();
                lblcon.Text = dr[2].ToString();
            }
            con.Close();
        }
    }

    protected void btnupd_Click(object sender, EventArgs e)
    {
        string tid = Session["Tid"].ToString();
        if (txtname.Text != "" && txtemail.Text != "" && txtcon.Text != "")
        {
            string up = "update Tutor set Name ='" + txtname.Text + "', Email ='" + txtemail.Text + "', Contact ='" + txtcon.Text + "' where Tid='" + tid + "'";
            SqlCommand cmd = new SqlCommand(up, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Tutorprofile.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }
}