using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Managesubject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql = "Select * from Subjects";
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

        if (txtcid.Text != "" && txtsubname.Text != "")
        {
            string ins = "Insert into Subjects (Cid,Sname) values ('" + txtcid.Text + "','" + txtsubname.Text + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Subject Added Susscessfully.')", true);
            Response.Redirect("Managesubject.aspx");
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
            string selectcmd = "SELECT Sbid,Cid,Sname FROM Subjects where Sbid='" + id + "'";
            SqlCommand cmd = new SqlCommand(selectcmd, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                utxtsid.Text = dr[0].ToString();
                utxtcid.Text = dr[1].ToString();
                utxtsname.Text = dr[2].ToString();
            }


        }
        else if(e.CommandName == "del")
        {

            int id = Convert.ToInt16(e.CommandArgument.ToString());
            string upd = " delete from Subjects where Sbid = '" + id + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Subjects Deleted Susscessfully.')", true);
            Response.Redirect("ManageSubject.aspx");
        }
    }

    protected void btn_upd_Click(object sender, EventArgs e)
    {
        if (utxtcid.Text != "" && utxtsname.Text != "")
        {
            string upd = " update Subjects set Cid = '" + utxtcid.Text + "', Sname = '" + utxtsname.Text + "' where Sbid = '" + utxtsid.Text + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Subjects Updated Susscessfully.')", true);
            Response.Redirect("ManageSubject.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }
}