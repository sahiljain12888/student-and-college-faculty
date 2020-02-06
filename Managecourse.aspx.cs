using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Managecourse : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql = "Select * from Course";
            SqlDataAdapter da1 = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da1.Fill(ds);
            int i = ds.Tables[0].Rows.Count;
            if (i > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        

        if (txtcourse.Text != "" && txtsubcourse.Text != "")
        {
            string ins = "Insert into Course (Cname,SubCname) values ('" + txtcourse.Text + "','" + txtsubcourse.Text + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Course Added Susscessfully.')", true);
            Response.Redirect("Managecourse.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "upd")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            int id = Convert.ToInt16(e.CommandArgument.ToString());
            string selectcmd = "SELECT Cid,Cname,SubCname FROM Course where Cid='"+id+"'";
            SqlCommand cmd = new SqlCommand(selectcmd, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                utxtid.Text = dr[0].ToString();
                utxtcname.Text = dr[1].ToString();
                utxtsubname.Text = dr[2].ToString();
            }
            

        }
    }

    protected void btn_upd_Click(object sender, EventArgs e)
    {
        if (utxtcname.Text != "" && utxtsubname.Text != "")
        {
            string upd= " update Course set Cname = '" + utxtcname.Text + "', SubCname = '" + utxtsubname.Text + "' where Cid = '" + utxtid.Text + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Course Updated Susscessfully.')", true);
            Response.Redirect("Managecourse.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }
}